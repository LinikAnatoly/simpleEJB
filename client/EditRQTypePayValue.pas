
unit EditRQTypePayValue;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQTypePayValueController ;

type
  TfrmRQTypePayValueEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblValue : TLabel;
    edtValue: TEdit;


  HTTPRIORQTypePayValue: THTTPRIO;

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
  frmRQTypePayValueEdit: TfrmRQTypePayValueEdit;
  RQTypePayValueObj: RQTypePayValue;

implementation


{uses  
    EnergyproController, EnergyproController2, RQTypePayValueController  ;
}
{$R *.dfm}



procedure TfrmRQTypePayValueEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtValue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQTypePayValueObj.code);
    if ( RQTypePayValueObj.value <> Low(Integer) ) then
       edtValue.Text := IntToStr(RQTypePayValueObj.value)
    else
       edtValue.Text := '';


  end;
end;



procedure TfrmRQTypePayValueEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQTypePayValue: RQTypePayValueControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtValue
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQTypePayValue := HTTPRIORQTypePayValue as RQTypePayValueControllerSoapPort;


     if ( edtValue.Text <> '' ) then
       RQTypePayValueObj.value := StrToInt(edtValue.Text)
     else
       RQTypePayValueObj.value := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      RQTypePayValueObj.code:=low(Integer);
      TempRQTypePayValue.add(RQTypePayValueObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQTypePayValue.save(RQTypePayValueObj);
    end;
  end;
end;


end.