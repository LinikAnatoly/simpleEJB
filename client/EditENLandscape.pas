
unit EditENLandscape;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLandscapeController ;

type
  TfrmENLandscapeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENLandscape: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENLandscapeEdit: TfrmENLandscapeEdit;
  ENLandscapeObj: ENLandscape;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLandscapeController  ;
}
{$R *.dfm}



procedure TfrmENLandscapeEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENLandscapeObj.code);
    edtName.Text := ENLandscapeObj.name; 


  end;
end;



procedure TfrmENLandscapeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLandscape: ENLandscapeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENLandscape := HTTPRIOENLandscape as ENLandscapeControllerSoapPort;


     ENLandscapeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENLandscapeObj.code:=low(Integer);
      TempENLandscape.add(ENLandscapeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENLandscape.save(ENLandscapeObj);
    end;
  end;
end;


end.