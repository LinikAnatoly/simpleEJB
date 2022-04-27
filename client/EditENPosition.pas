
unit EditENPosition;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPositionController ;

type
  TfrmENPositionEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblFinCode : TLabel;
    edtFinCode: TEdit;


  HTTPRIOENPosition: THTTPRIO;

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
  frmENPositionEdit: TfrmENPositionEdit;
  ENPositionObj: ENPosition;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPositionController  ;
}
{$R *.dfm}



procedure TfrmENPositionEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENPositionObj.name; 
    if ( ENPositionObj.finCode <> Low(Integer) ) then
       edtFinCode.Text := IntToStr(ENPositionObj.finCode)
    else
       edtFinCode.Text := '';


  end;
end;



procedure TfrmENPositionEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPosition: ENPositionControllerSoapPort;
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
    TempENPosition := HTTPRIOENPosition as ENPositionControllerSoapPort;


     ENPositionObj.name := edtName.Text; 

     if ( edtFinCode.Text <> '' ) then
       ENPositionObj.finCode := StrToInt(edtFinCode.Text)
     else
       ENPositionObj.finCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      ENPositionObj.code:=low(Integer);
      TempENPosition.add(ENPositionObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPosition.save(ENPositionObj);
    end;
  end;
end;


end.