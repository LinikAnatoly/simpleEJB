
unit EditSCOrder;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCOrderController ;

type
  TfrmSCOrderEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblMolCode : TLabel;
    edtMolCode: TEdit;
    lblPodrCode : TLabel;
    edtPodrCode: TEdit;
    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblScCode : TLabel;
    edtScCode: TEdit;


  HTTPRIOSCOrder: THTTPRIO;

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
  frmSCOrderEdit: TfrmSCOrderEdit;
  SCOrderObj: SCOrder;

implementation


{uses  
    EnergyproController, EnergyproController2, SCOrderController  ;
}
{$R *.dfm}



procedure TfrmSCOrderEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMolCode
      ,edtPodrCode
      ,edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(SCOrderObj.code);
    edtMolCode.Text := SCOrderObj.molCode; 
    edtPodrCode.Text := SCOrderObj.podrCode; 
    if ( SCOrderObj.countGen <> Low(Integer) ) then
       edtCountGen.Text := IntToStr(SCOrderObj.countGen)
    else
       edtCountGen.Text := '';
    if ( SCOrderObj.scCode <> Low(Integer) ) then
       edtScCode.Text := IntToStr(SCOrderObj.scCode)
    else
       edtScCode.Text := '';


  end;
end;



procedure TfrmSCOrderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCOrder: SCOrderControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMolCode
      ,edtPodrCode
      ,edtCountGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempSCOrder := HTTPRIOSCOrder as SCOrderControllerSoapPort;


     SCOrderObj.molCode := edtMolCode.Text; 

     SCOrderObj.podrCode := edtPodrCode.Text; 

     if ( edtCountGen.Text <> '' ) then
       SCOrderObj.countGen := StrToInt(edtCountGen.Text)
     else
       SCOrderObj.countGen := Low(Integer) ;

     if ( edtScCode.Text <> '' ) then
       SCOrderObj.scCode := StrToInt(edtScCode.Text)
     else
       SCOrderObj.scCode := Low(Integer) ;

    if DialogState = dsInsert then
    begin
      SCOrderObj.code:=low(Integer);
      TempSCOrder.add(SCOrderObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempSCOrder.save(SCOrderObj);
    end;
  end;
end;


end.