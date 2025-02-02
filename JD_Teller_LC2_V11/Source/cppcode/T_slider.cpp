#include "T_IPC.H"
#include "T_NUC.H"

#define SLIDERBUTTON      14
#define SLIDERDECENT       6
#define SLIDERDEFPOS  -12345

typedef struct 
{
  _BOOL     focus;
  _KOORD    oldpos;
  _KOORD    startpos;
  _DWORD    startvalue;
  _ROOM     room;
  _RESULT   value;
  _VARLABEL server;
  _DWORD    pix_range;
  _REAL     val_range;
  _BOOL     reverse;
}
_SLIDER;

_SLIDER Slider;

_BOOL is_horizontal(_ROOM *pr)
{
  _DWORD xx = pr->xy2.x - pr->xy1.x;
  _DWORD yy = pr->xy2.y - pr->xy1.y;
  
  if(yy < xx) // horizontal
    return _TRUE;

  return _FALSE;
}

void get_minmax(_RESULT *pres, _THEURGE *ptu)
{
  _VARLABEL *pvl;
  _RESULT   tmp;
  _VARIABLE variable;

  if(ptu != NULL)
  {
    if(ptu->memvarlabel.no >= 1)
    {
      pvl = ptu->memvarlabel.ptr;
      if(pvl->no > 0)
      {
        if(VarList.GetSystemData(&tmp, &variable, pvl, _TRUE, _FALSE) == _TRUE)
        {
          transform_RESULT(&tmp, pres->ftype);
//          if(tmp.ftype == RES_REAL)
//          {
//            tmp.value = FTOL(*(_REAL*)&tmp.value);
//          }
          pres->rmin = tmp.value;
        }
      }

      if(ptu->memvarlabel.no >= 2)
      {
        pvl += 1;
        if(pvl->no > 0)
        {
          if(VarList.GetSystemData(&tmp, &variable, pvl, _TRUE, _FALSE) == _TRUE)
          {
            transform_RESULT(&tmp, pres->ftype);
//            if(tmp.ftype == RES_REAL)
//            {
//              tmp.value = FTOL(*(_REAL*)&tmp.value);
//            }
            pres->rmax = tmp.value;
          }
        }
      }
    }
  }
}

void init_SLIDER(_EDITOR *pedi)
{
  _BMP *bmpslider = NULL;
  _UDWORD sliderbutton = SLIDERBUTTON;
  _UWORD fxx, fyy;

  Slider.focus      = _TRUE;
  Slider.oldpos     = SLIDERDEFPOS;
  Slider.startpos   = SLIDERDEFPOS;
  Slider.room       = pedi->input.io.space;
  Slider.value      = pedi->result;
  Slider.reverse    = _FALSE;

  get_minmax(&Slider.value, pedi->input.io.theurge);
  
  if(pedi->result.ftype == RES_REAL)
  {
    move_pREAL_pREAL((_REAL*)&Slider.startvalue, (_REAL*)&pedi->result.value);

    if(get_pREAL((_REAL*)&Slider.startvalue) < get_pREAL((_REAL*)&Slider.value.rmin))
      move_pREAL_pREAL((_REAL*)&Slider.startvalue, (_REAL*)&Slider.value.rmin);
    
    if(get_pREAL((_REAL*)&Slider.startvalue) > get_pREAL((_REAL*)&Slider.value.rmax))
      move_pREAL_pREAL((_REAL*)&Slider.startvalue, (_REAL*)&Slider.value.rmax);
      
    Slider.val_range = get_pREAL((_REAL*)&Slider.value.rmax) - get_pREAL((_REAL*)&Slider.value.rmin);
  }
  else
  {
    Slider.startvalue = pedi->result.value;
  
    if(Slider.startvalue < Slider.value.rmin)
      Slider.startvalue = Slider.value.rmin;
    
    if(Slider.startvalue > Slider.value.rmax)
      Slider.startvalue = Slider.value.rmax;
      
    Slider.val_range = (_REAL)Slider.value.rmax - (_REAL)Slider.value.rmin;
  }
  
  Slider.server = pedi->input.io.variable;
  
  if(pedi->input.io.theurge != NULL) 
  {
    if(pedi->input.io.theurge->memanything.no >= 1)
    {
      if(pedi->input.io.theurge->memanything.ptr[0].list == ICONLST)
        bmpslider = ImageList.Get(pedi->input.io.theurge->memanything.ptr[0].no);
    }
    
    if(pedi->input.io.theurge->membool.no >= 1)
    {
      Slider.reverse = pedi->input.io.theurge->membool.ptr[0];
    }
  }
  
  if(is_horizontal(&Slider.room) == _TRUE)
  {
    if(bmpslider != NULL)
    {
      Slider.pix_range = Slider.room.xy2.x - Slider.room.xy1.x + 1 - bmpslider->width;
    }
    else
    {
      theme_minsize(pedi->input.io.frametype, T_COPY | T_SOLID | T_INVERTTHEME, &fxx, &fyy);
      if(fxx > sliderbutton)
        sliderbutton = fxx;
      Slider.pix_range = Slider.room.xy2.x - Slider.room.xy1.x + 1 - sliderbutton;
    }
  }
  else
  {
    if(bmpslider != NULL)
    {
      Slider.pix_range = Slider.room.xy2.y - Slider.room.xy1.y + 1 - bmpslider->height;
    }
    else
    {
      theme_minsize(pedi->input.io.frametype, T_COPY | T_SOLID | T_INVERTTHEME, &fxx, &fyy);
      if(fyy > sliderbutton)
        sliderbutton = fyy;
      Slider.pix_range = Slider.room.xy2.y - Slider.room.xy1.y + 1 - sliderbutton;
    }
  }
}

void free_SLIDER()
{
  Slider.focus    = _FALSE;
  Slider.oldpos   = SLIDERDEFPOS;
  Slider.startpos = SLIDERDEFPOS;
}

void draw_SLIDER(_ROOM *pr, _IMAGE *pimg, _DWORD value, _BOOL reverse, _UDWORD backimage, _UDWORD sliderimage, _ATTRIB att, _FRAMETYPE frametype, _COLOR colback, _COLOR colframe, _COLOR colsledge)
{
  _NEWSCREEN act;
  _DWORD range = 10000;
  _ROOM room_decent = *pr;
  _ROOM room_slider = *pr;
  _UWORD fxx, fyy;
  _DWORD xx = room_decent.xy2.x - room_decent.xy1.x + 1;
  _DWORD yy = room_decent.xy2.y - room_decent.xy1.y + 1;
  
  _BMP *bmpslider = ImageList.Get(sliderimage);
  _BMP *bmpback   = ImageList.Get(backimage);
  
  _WORD sliderbutton = SLIDERBUTTON;
  _WORD sliderdecent = SLIDERDECENT;

  theme_minsize(frametype, att, &fxx, &fyy);
  
  if(yy < xx) // horizontal
  {
    if(bmpslider != NULL)
      sliderbutton = bmpslider->width;
    else if(sliderbutton < fxx)
      sliderbutton = fxx;
      
    if(sliderdecent < fyy)
      sliderdecent = fyy;
 
    room_decent.xy1.y += (yy - sliderdecent) / 2;
    room_decent.xy2.y  = room_decent.xy1.y + sliderdecent - 1;
    room_decent.xy1.x += sliderbutton / 2;
    room_decent.xy2.x -= sliderbutton / 2;
    
    if(reverse == _TRUE)
    {
      room_slider.xy2.x = room_slider.xy2.x - (((xx - sliderbutton) * value) / range);
      room_slider.xy1.x = room_slider.xy2.x - sliderbutton + 1;
    }
    else
    {
      room_slider.xy1.x = room_slider.xy1.x + (((xx - sliderbutton) * value) / range);
      room_slider.xy2.x = room_slider.xy1.x + sliderbutton - 1;
    }
    
    if(bmpslider != NULL)
    {  
      room_slider.xy1.y = (room_slider.xy1.y + room_slider.xy2.y - bmpslider->height) / 2;
      room_slider.xy2.y = room_slider.xy1.y + bmpslider->height - 1;
    } 
  }
  else // vertical
  {
    if(bmpslider != NULL)
      sliderbutton = bmpslider->height;
    else if(sliderbutton < fyy)
      sliderbutton = fyy;

    if(sliderdecent < fxx)
      sliderdecent = fxx;
  
    room_decent.xy1.x += (xx - sliderdecent) / 2;
    room_decent.xy2.x  = room_decent.xy1.x + sliderdecent - 1;
    room_decent.xy1.y += sliderbutton / 2;
    room_decent.xy2.y -= sliderbutton / 2;
  
    if(reverse == _TRUE)
    {
      room_slider.xy1.y = room_slider.xy1.y + (((yy - sliderbutton) * value) / range);
      room_slider.xy2.y = room_slider.xy1.y + sliderbutton - 1;
    }
    else
    {
      room_slider.xy2.y = room_slider.xy2.y - (((yy - sliderbutton) * value) / range);
      room_slider.xy1.y = room_slider.xy2.y - sliderbutton + 1;
    }
    
    if(bmpslider != NULL)
    {
      room_slider.xy1.x = (room_slider.xy1.x + room_slider.xy2.x - bmpslider->width) / 2;
      room_slider.xy2.x = room_slider.xy1.x + bmpslider->width - 1;
    }
  }
  
  push_screen(&act);
 
  if((pimg == NULL) || (pimg->ptr == NULL))
    Bar(pr->xy1.x, pr->xy1.y, pr->xy2.x, pr->xy2.y, att, colback);
  else
    PutImage(pimg, DEFKOORD, DEFKOORD);
  
  if(is_invisible(colback, T_COPY | T_SOLID) == _FALSE)
  {
    _COLOR cf = colframe;
    if(frametype < _THEMEFRAME)
      cf = MakeColor_Makro(GetPenColor_Makro(cf), GetBackColor_Makro(cf));
    DrawButton(&room_decent, att ^ T_INVERTTHEME, frametype, colback, cf);
  }
  
  if(bmpback != NULL)
    out_zoom_BMP(pr, bmpback, T_COPY | T_SOLID);

  if(bmpslider != NULL)
    Bitmap(room_slider.xy1.x, room_slider.xy1.y,bmpslider, T_COPY | T_SOLID, 0);
  else
    DrawButton(&room_slider, att, frametype, colsledge, colframe);

  pop_screen(&act);
  copy_screen(&act, pr);
}


_BOOL out_SLIDER(_IO *pio, _RESULT *pres, _VARIABLE *pv)
{
  _THEURGE *ptu = pio->theurge;
  _RESULT  res = *pres;
  _UDWORD  sliderimage = 0xFFFFFFFF;
  _UDWORD  backgroundimage = 0xFFFFFFFF;
  _BOOL    reverse = _FALSE;

  if(ptu == NULL)
    return _FALSE;

  get_minmax(&res, pio->theurge);

  if(ptu->memimage.no >= 1)
  {
    backgroundimage = ptu->memimage.ptr[0].no;
  }
    
  if(ptu->memanything.no >= 1)
  {
    if(ptu->memanything.ptr[0].list == ICONLST)
      sliderimage = ptu->memanything.ptr[0].no;
  }
  
  if(ptu->membool.no >= 1)
  {
    reverse = ptu->membool.ptr[0];
  }

  if(res.ftype == RES_REAL)
  {
    _REAL rmin = get_pREAL((_REAL*)&res.rmin);
    _REAL rmax = get_pREAL((_REAL*)&res.rmax);
    _REAL rval = get_pREAL((_REAL*)&res.value);
    
    if(rval < rmin)
      rval = rmin;
    else if(rval > rmax)
      rval = rmax;
  
    rval = ((rval - rmin) * 10000) / (rmax - rmin);
  
    draw_SLIDER(&pio->space, &pio->image, FTOL(rval), reverse, backgroundimage, sliderimage, pio->attrib, pio->frametype, pio->colback, pio->colframe, pio->coltxt);
  }
  else
  {
    if(res.value < res.rmin)
      res.value = res.rmin;
    else if(res.value > res.rmax)
      res.value = res.rmax;
  
    _REAL range = (_REAL)res.rmax - (_REAL)res.rmin;
    res.value = FTOL(((((_REAL)res.value - (_REAL)res.rmin) * 10000) / range) + 0.5);
  
    draw_SLIDER(&pio->space, &pio->image, res.value, reverse, backgroundimage, sliderimage, pio->attrib, pio->frametype, pio->colback, pio->colframe, pio->coltxt);
  }
  
  return _TRUE;
}

_BOOL move_SLIDER(_DWORD delta_pixel)
{
  _BOOL  retcode = _FALSE;
  _REAL  newval;
  _DWORD dval;
  
  if(Slider.focus == _TRUE)
  {
    if(Slider.reverse == _TRUE)
      delta_pixel = -delta_pixel;
    
    if(Slider.value.ftype == RES_REAL)
    {
      _REAL sval = get_pREAL((_REAL*)&Slider.startvalue);
      _REAL rmax = get_pREAL((_REAL*)&Slider.value.rmax);
      _REAL rmin = get_pREAL((_REAL*)&Slider.value.rmin);
      
      newval = (sval + ((_REAL)delta_pixel * Slider.val_range) / (_REAL)Slider.pix_range);
      if(newval > rmax)
        newval = rmax;
      else if(newval < rmin)
        newval = rmin;
    
      if(newval != get_pREAL((_REAL*)&Slider.value.value))
      {
        retcode = _TRUE;
        
        _RESULT   result;
        _VARIABLE variable;

        init_RESULT_Makro(&result);
        move_pREAL_REAL((_REAL*)&result.rmax,  newval);
        move_pREAL_REAL((_REAL*)&result.rmin,  newval);
        move_pREAL_REAL((_REAL*)&result.value, newval);
        result.ptr   = &result.value;
        result.ftype = RES_REAL;
        if(VarList.SetSystemData(&result, &variable, &Slider.server, _TRUE) == _TRUE)
        {
          move_pREAL_REAL((_REAL*)&Slider.value.value, newval);
        }
      }
    }
    else
    {
      newval = ((_REAL)Slider.startvalue + ((_REAL)delta_pixel * Slider.val_range) / (_REAL)Slider.pix_range);
      if(newval > (_REAL)Slider.value.rmax)
        newval = (_REAL)Slider.value.rmax;
      else if(newval < (_REAL)Slider.value.rmin)
        newval = (_REAL)Slider.value.rmin;
    
      if(newval < 0)
      {
        dval = FTOL(newval - 0.5);
      }
      else
      {
        dval = FTOL(newval + 0.5);
      }
    
      if(newval > 2147483647.0)
        dval = 2147483647;
      else if(newval < -2147483648.0)
        dval = -2147483647;
    
      if(dval != Slider.value.value)
      {
        retcode = _TRUE;
        if(VarList_SetValue(&Slider.server, dval) == _TRUE)
          Slider.value.value = dval;
      }
    }
  }
  
  return retcode;
}

_DOIT getevent_SLIDER(_EVENT *pev, _EDITOR *pedi)
{
  _DOIT retcode = _IDLE;

  if(Slider.focus == _TRUE)
  {
    if(pev->ftype == _EVENT_HIDMOVE)
    {
      if((pev->dot.x >= Slider.room.xy1.x) && (pev->dot.x <= Slider.room.xy2.x) && (pev->dot.y >= Slider.room.xy1.y) && (pev->dot.y <= Slider.room.xy2.y))
      {
        retcode = _IDIDIT;
        if(is_horizontal(&Slider.room) == _TRUE)
        {
          // horizontal
          if(Slider.oldpos == SLIDERDEFPOS)
          {
            Slider.startpos = pev->dot.x;
            Slider.oldpos   = pev->dot.x;
          }
          
          if(Slider.oldpos != pev->dot.x)
          {
            //move_SLIDER(pev->dot.x - Slider.startpos);
            move_SLIDER(pev->dot.x - Slider.startpos);
            Slider.oldpos = pev->dot.x;
          }
        }
        else
        {
          // vertical
          if(Slider.oldpos == SLIDERDEFPOS)
          {
            Slider.startpos = pev->dot.y;
            Slider.oldpos   = pev->dot.y;
          }
          
          if(Slider.oldpos != pev->dot.y)
          {
            //move_SLIDER(Slider.startpos - pev->dot.y);
            move_SLIDER(Slider.startpos - pev->dot.y);
            Slider.oldpos = pev->dot.y;
          }
          
        }
      }
      
      retcode = _IDIDIT;
    }
    else if(pev->ftype == _EVENT_HIDRELEASE)
    {
      Slider.oldpos = SLIDERDEFPOS;
      Slider.startpos = SLIDERDEFPOS;
      Root.FindTop()->CMD_KillEditor();
    }
    else if(pev->ftype == _EVENT_HIDPRESS)
    {
      Slider.oldpos = SLIDERDEFPOS;
      Slider.startpos = SLIDERDEFPOS;
    }
    else if((pev->ftype == _EVENT_KEYPRESS)||(pev->ftype == _EVENT_KEYRELEASE))
    {
//      if(pev->scancode == _PGUP)
//      {
//        if(pev->ftype == _EVENT_KEYPRESS)
//          move_SLIDER(1);
//        retcode = _IDIDIT;
//      }
//      if(pev->scancode == _PGDOWN)
//      {
//        if(pev->ftype == _EVENT_KEYPRESS)
//          move_SLIDER(-1);
//        retcode = _IDIDIT;
//      }
      
      if(is_navigation_key(pev->scancode) == _FALSE)
      {
        retcode = _IDIDIT;
      }
    }
  }
  
  return retcode;
}

_DOIT killfocus_SLIDER(_EDITOR *pedi)
{
  _DOIT retcode = _IDLE;

  free_SLIDER();
  
  return retcode;
}

_DOIT getfocus_SLIDER(_EDITOR *pedi)
{
  _DOIT retcode = _IDLE;
  
  //init_SLIDER(&pedi->input.io.space, &pedi->result);
  init_SLIDER(pedi);
  
  return retcode;
}


_BOOL getvalue_SLIDER(_RESULT *res, _IO *pio)
{
  //if(Slider.)  


  return _TRUE;
}

