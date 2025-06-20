return {
  black = 0xff181926,
  white = 0xffffffff,
  red = 0xffed8796,
  green = 0xffa6da95,
  blue = 0xff8aadf4,
  yellow = 0xffeed49f,
  orange = 0xfff5a97f,
  magenta = 0xffc6a0f6,
  grey = 0x99ffffff,
  transparent = 0x00000000,

  fg = 0xff7aa2f7,
  bg = 0xff000111,
  nv_blue = 0xff00BFFF,
  nv_blue_dark = 0xaa7aa2ff,

  bar = {
    -- bg = 0xff000111,
    bg = 0xff000111,
    border = 0xffffffff,
  },
  popup = {
    bg = 0x11100000,
    border = 0xffcad3f5,
  },
  bg2 = 0xff494d64,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then
      return color
    end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
