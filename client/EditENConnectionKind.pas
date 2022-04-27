
unit EditENConnectionKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionKindController ;

type
  TfrmENConnectionKindEdit = class(TDialogForm)

  btnOk: TButton;
  btnCancel: TButton;
    lblConnectionKind: TLabel;
    cbConectionKind: TComboBox;

  procedure FormShow(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENConnectionKindEdit: TfrmENConnectionKindEdit;
  ENConnectionKindObj: ENConnectionKind;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionKindController  ;
}
{$R *.dfm}



procedure TfrmENConnectionKindEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
  //  DenyBlankValues([]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;
end;



end.
