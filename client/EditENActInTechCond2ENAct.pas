
unit EditENActInTechCond2ENAct;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActInTechCond2ENActController ;

type
  TfrmENActInTechCond2ENActEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblSummaGen : TLabel;
    edtSummaGen: TEdit;


  HTTPRIOENActInTechCond2ENAct: THTTPRIO;

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
  frmENActInTechCond2ENActEdit: TfrmENActInTechCond2ENActEdit;
  ENActInTechCond2ENActObj: ENActInTechCond2ENAct;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActInTechCond2ENActController  ;
}
{$R *.dfm}



procedure TfrmENActInTechCond2ENActEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENActInTechCond2ENActObj.code);
    if ( ENActInTechCond2ENActObj.summaGen <> nil ) then
       edtSummaGen.Text := ENActInTechCond2ENActObj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 


  end;
end;



procedure TfrmENActInTechCond2ENActEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActInTechCond2ENAct: ENActInTechCond2ENActControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENActInTechCond2ENAct := HTTPRIOENActInTechCond2ENAct as ENActInTechCond2ENActControllerSoapPort;


     if (ENActInTechCond2ENActObj.summaGen = nil ) then
       ENActInTechCond2ENActObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       ENActInTechCond2ENActObj.summaGen.decimalString := edtSummaGen.Text 
     else
       ENActInTechCond2ENActObj.summaGen := nil;

    if DialogState = dsInsert then
    begin
      ENActInTechCond2ENActObj.code:=low(Integer);
      TempENActInTechCond2ENAct.add(ENActInTechCond2ENActObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActInTechCond2ENAct.save(ENActInTechCond2ENActObj);
    end;
  end;
end;


end.