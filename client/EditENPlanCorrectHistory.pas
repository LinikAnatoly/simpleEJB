
unit EditENPlanCorrectHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanCorrectHistoryController ;

type
  TfrmENPlanCorrectHistoryEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENPlanCorrectReasonName : TLabel;
  edtENPlanCorrectReasonName: TEdit;
  spbENPlanCorrectReason: TSpeedButton;
  

  HTTPRIOENPlanCorrectHistory: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPlanCorrectReasonClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPlanCorrectHistoryEdit: TfrmENPlanCorrectHistoryEdit;
  ENPlanCorrectHistoryObj: ENPlanCorrectHistory;

implementation

uses
  ShowENPlanCorrectReason
  ,ENPlanCorrectReasonController
;

{uses  
    EnergyproController, EnergyproController2, ENPlanCorrectHistoryController  ;
}
{$R *.dfm}



procedure TfrmENPlanCorrectHistoryEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
      , edtENPlanCorrectReasonName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      if ENPlanCorrectHistoryObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPlanCorrectHistoryObj.dateGen.Year,ENPlanCorrectHistoryObj.dateGen.Month,ENPlanCorrectHistoryObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
    edtCommentGen.Text := ENPlanCorrectHistoryObj.commentGen; 
    edtUserGen.Text := ENPlanCorrectHistoryObj.userGen; 
      if ENPlanCorrectHistoryObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanCorrectHistoryObj.dateEdit.Year,ENPlanCorrectHistoryObj.dateEdit.Month,ENPlanCorrectHistoryObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    edtENPlanCorrectReasonName.Text := ENPlanCorrectHistoryObj.reason.name;

  end;
end;



procedure TfrmENPlanCorrectHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanCorrectHistory: ENPlanCorrectHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
  edtENPlanCorrectReasonName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPlanCorrectHistory := HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;


     if edtdateGen.checked then
     begin 
       if ENPlanCorrectHistoryObj.dateGen = nil then
          ENPlanCorrectHistoryObj.dateGen := TXSDate.Create;
       ENPlanCorrectHistoryObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENPlanCorrectHistoryObj.dateGen := nil;

     ENPlanCorrectHistoryObj.commentGen := edtCommentGen.Text; 

     ENPlanCorrectHistoryObj.userGen := edtUserGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENPlanCorrectHistoryObj.dateEdit = nil then
          ENPlanCorrectHistoryObj.dateEdit := TXSDate.Create;
       ENPlanCorrectHistoryObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENPlanCorrectHistoryObj.dateEdit := nil;

    if DialogState = dsInsert then
    begin
      ENPlanCorrectHistoryObj.code:=low(Integer);
      TempENPlanCorrectHistory.add(ENPlanCorrectHistoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPlanCorrectHistory.save(ENPlanCorrectHistoryObj);
    end;
  end;
end;

procedure TfrmENPlanCorrectHistoryEdit.spbENPlanCorrectReasonClick(Sender : TObject);
var 
   frmENPlanCorrectReasonShow: TfrmENPlanCorrectReasonShow;
begin
   frmENPlanCorrectReasonShow:=TfrmENPlanCorrectReasonShow.Create(Application,fmNormal);
   try
      with frmENPlanCorrectReasonShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanCorrectHistoryObj.reason = nil then ENPlanCorrectHistoryObj.reason := ENPlanCorrectReason.Create();
               ENPlanCorrectHistoryObj.reason.code := StrToInt(GetReturnValue(sgENPlanCorrectReason,0));
               edtENPlanCorrectReasonName.Text:=GetReturnValue(sgENPlanCorrectReason,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPlanCorrectReasonShow.Free;
   end;
end;



end.