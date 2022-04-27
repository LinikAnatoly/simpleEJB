
unit EditRQBudgetItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQBudgetItemController ;

type
  TfrmRQBudgetItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDdscode : TLabel;
    edtDdscode: TEdit;
    lblSumGen : TLabel;
    edtSumGen: TEdit;


  HTTPRIORQBudgetItem: THTTPRIO;

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
  frmRQBudgetItemEdit: TfrmRQBudgetItemEdit;
  RQBudgetItemObj: RQBudgetItem;

implementation


{uses  
    EnergyproController, EnergyproController2, RQBudgetItemController  ;
}
{$R *.dfm}



procedure TfrmRQBudgetItemEdit.FormShow(Sender: TObject);

begin

   DisableControls([edtDdscode , edtCode]);

   SetFloatStyle(edtSumGen);
   edtSumGen.SetFocus;

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDdscode
      ,edtSumGen
     
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(RQBudgetItemObj.code);
    edtDdscode.Text := RQBudgetItemObj.ddscode; 
    if ( RQBudgetItemObj.sumGen <> nil ) then
       edtSumGen.Text := RQBudgetItemObj.sumGen.decimalString
    else
       edtSumGen.Text := '';

//      if RQBudgetItemObj.dateEdit <> nil then
//      begin
//        edtDateEdit.DateTime:=EncodeDate(RQBudgetItemObj.dateEdit.Year,RQBudgetItemObj.dateEdit.Month,RQBudgetItemObj.dateEdit.Day);
//        edtDateEdit.checked := true;
//      end
//      else
//      begin
//        edtDateEdit.DateTime:=SysUtils.Date;
//        edtDateEdit.checked := false;
//      end;
//    edtUserGen.Text := RQBudgetItemObj.userGen;


  end;
end;



procedure TfrmRQBudgetItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQBudgetItem: RQBudgetItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDdscode
      ,edtSumGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQBudgetItem := HTTPRIORQBudgetItem as RQBudgetItemControllerSoapPort;


     RQBudgetItemObj.ddscode := edtDdscode.Text; 

     if (RQBudgetItemObj.sumGen = nil ) then
       RQBudgetItemObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       RQBudgetItemObj.sumGen.decimalString := edtSumGen.Text 
     else
       RQBudgetItemObj.sumGen := nil;

//     if edtdateEdit.checked then
//     begin
//       if RQBudgetItemObj.dateEdit = nil then
//          RQBudgetItemObj.dateEdit := TXSDateTime.Create;
//       RQBudgetItemObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
//     end
//     else
//       RQBudgetItemObj.dateEdit := nil;
//
//     RQBudgetItemObj.userGen := edtUserGen.Text;

    if DialogState = dsInsert then
    begin
      RQBudgetItemObj.code:=low(Integer);
      TempRQBudgetItem.add(RQBudgetItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQBudgetItem.save(RQBudgetItemObj);
    end;
  end;
end;


end.