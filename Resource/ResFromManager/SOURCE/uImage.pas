unit uImage;

interface

uses
  Vcl.Imaging.PNGImage, Vcl.ExtCtrls;

procedure LoadPngFromRes(Img: TImage; const ResName: string);

implementation

procedure LoadPngFromRes(Img: TImage; const ResName: string);
var
  Png: TPngImage;
begin
  Png := TPngImage.Create;
  try
    Png.LoadFromResourceName(HInstance, ResName);
    Img.Picture.Graphic := Png;
  finally
    Png.Free;
  end;
end;

end.
