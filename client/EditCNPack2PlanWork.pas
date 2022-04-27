
unit EditCNPack2PlanWork;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, CNPack2PlanWorkController ;

type
  TfrmCNPack2PlanWorkEdit = class(TDialogForm)

    lblPackCode : TLabel;
    edtPackCode: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOCNPack2PlanWork: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmCNPack2PlanWorkEdit: TfrmCNPack2PlanWorkEdit;
  CNPack2PlanWorkObj: CNPack2PlanWork;

implementation


{uses  
    EnergyproController, EnergyproController2, CNPack2PlanWorkController  ;
}
{$R *.dfm}



procedure TfrmCNPack2PlanWorkEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPackCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ( CNPack2PlanWorkObj.packCode <> Low(Integer) ) then
       edtPackCode.Text := IntToStr(CNPack2PlanWorkObj.packCode)
    else
       edtPackCode.Text := '';
    MakeMultiline(edtCommentGen.Lines, CNPack2PlanWorkObj.commentGen);
    edtUserGen.Text := CNPack2PlanWorkObj.userGen; 
      if CNPack2PlanWorkObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(CNPack2PlanWorkObj.dateEdit.Year,CNPack2PlanWorkObj.dateEdit.Month,CNPack2PlanWorkObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;
end;



procedure TfrmCNPack2PlanWorkEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempCNPack2PlanWork: CNPack2PlanWorkControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      //edtPackCode
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempCNPack2PlanWork := HTTPRIOCNPack2PlanWork as CNPack2PlanWorkControllerSoapPort;


     if ( edtPackCode.Text <> '' ) then
       CNPack2PlanWorkObj.packCode := StrToInt(edtPackCode.Text)
     else
       CNPack2PlanWorkObj.packCode := Low(Integer) ;

     CNPack2PlanWorkObj.commentGen := edtCommentGen.Text; 

     CNPack2PlanWorkObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if CNPack2PlanWorkObj.dateEdit = nil then
          CNPack2PlanWorkObj.dateEdit := TXSDate.Create;
       CNPack2PlanWorkObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       CNPack2PlanWorkObj.dateEdit := nil;
    {
    if DialogState = dsInsert then
    begin
      CNPack2PlanWorkObj.code:=low(Integer);
      TempCNPack2PlanWork.add(CNPack2PlanWorkObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempCNPack2PlanWork.save(CNPack2PlanWorkObj);
    end;
    }
    TempCNPack2PlanWork.createPack(CNPack2PlanWorkObj);
    
  end;
end;


end.
