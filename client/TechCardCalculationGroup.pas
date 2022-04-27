unit TechCardCalculationGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid, AdvGrid,
  DlgUnit, GridHeadersUnit, ChildFormUnit, AdvObj, StdCtrls, Buttons;


type
  TfrmTechCardCalculationGroup = class(TForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    sgTechCardCalculationGroup: TAdvStringGrid;

  private
   { Private declarations }
 public
   { Public declarations }
 end;

var frmTechCardCalculationGroup: TfrmTechCardCalculationGroup;

implementation

{$R *.dfm}
const TechCardCalculationHeaders: array [1..4] of String =
  ('Код', 'Шифр', 'Содержание', 'Включение');

end.
