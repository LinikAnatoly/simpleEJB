
unit EditENCabelMuftaType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCabelMuftaTypeController ;

type
  TfrmENCabelMuftaTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENCabelMuftaType: THTTPRIO;

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
  frmENCabelMuftaTypeEdit: TfrmENCabelMuftaTypeEdit;
  ENCabelMuftaTypeObj: ENCabelMuftaType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCabelMuftaTypeController  ;
}
{$R *.dfm}



procedure TfrmENCabelMuftaTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENCabelMuftaTypeObj.code);
    edtName.Text := ENCabelMuftaTypeObj.name; 


  end;
end;



procedure TfrmENCabelMuftaTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCabelMuftaType: ENCabelMuftaTypeControllerSoapPort;
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
    TempENCabelMuftaType := HTTPRIOENCabelMuftaType as ENCabelMuftaTypeControllerSoapPort;


     ENCabelMuftaTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENCabelMuftaTypeObj.code:=low(Integer);
      TempENCabelMuftaType.add(ENCabelMuftaTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCabelMuftaType.save(ENCabelMuftaTypeObj);
    end;
  end;
end;


end.