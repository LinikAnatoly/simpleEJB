
unit EditRQContactType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQContactTypeController ;

type
  TfrmRQContactTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIORQContactType: THTTPRIO;

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
  frmRQContactTypeEdit: TfrmRQContactTypeEdit;
  RQContactTypeObj: RQContactType;

implementation


{uses  
    EnergyproController, EnergyproController2, RQContactTypeController  ;
}
{$R *.dfm}



procedure TfrmRQContactTypeEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode]);

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
      edtCode.Text := IntToStr(RQContactTypeObj.code);
    edtName.Text := RQContactTypeObj.name; 


  end;
end;



procedure TfrmRQContactTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQContactType: RQContactTypeControllerSoapPort;
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
    TempRQContactType := HTTPRIORQContactType as RQContactTypeControllerSoapPort;


     RQContactTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      RQContactTypeObj.code:=low(Integer);
      TempRQContactType.add(RQContactTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQContactType.save(RQContactTypeObj);
    end;
  end;
end;


end.