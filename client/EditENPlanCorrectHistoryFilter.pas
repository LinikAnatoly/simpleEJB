
unit EditENPlanCorrectHistoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanCorrectHistoryController ;

type
  TfrmENPlanCorrectHistoryFilterEdit = class(TDialogForm)

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
  frmENPlanCorrectHistoryFilterEdit: TfrmENPlanCorrectHistoryFilterEdit;
  ENPlanCorrectHistoryFilterObj: ENPlanCorrectHistoryFilter;

implementation

uses
  ShowENPlanCorrectReason
  ,ENPlanCorrectReasonController
;

{uses  
    EnergyproController, EnergyproController2, ENPlanCorrectHistoryController  ;
}
{$R *.dfm}



procedure TfrmENPlanCorrectHistoryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateGen
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


  end;

}

end;



procedure TfrmENPlanCorrectHistoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanCorrectHistory: ENPlanCorrectHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ENPlanCorrectHistoryFilterObj.dateGen = nil then
        ENPlanCorrectHistoryFilterObj.dateGen := TXSDate.Create;
      ENPlanCorrectHistoryFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));




     ENPlanCorrectHistoryFilterObj.commentGen := edtCommentGen.Text; 



     ENPlanCorrectHistoryFilterObj.userGen := edtUserGen.Text; 



     if ENPlanCorrectHistoryFilterObj.dateEdit = nil then
        ENPlanCorrectHistoryFilterObj.dateEdit := TXSDate.Create;
      ENPlanCorrectHistoryFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));





  end;
end;

procedure TfrmENPlanCorrectHistoryFilterEdit.spbENPlanCorrectReasonClick(Sender : TObject);
var 
   frmENPlanCorrectReasonShow: TfrmENPlanCorrectReasonShow;
begin
   frmENPlanCorrectReasonShow:=TfrmENPlanCorrectReasonShow.Create(Application,fmNormal);
   try
      with frmENPlanCorrectReasonShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanCorrectHistoryFilterObj.reason = nil then ENPlanCorrectHistoryFilterObj.reason := ENPlanCorrectReason.Create();
               ENPlanCorrectHistoryFilterObj.reason.code := StrToInt(GetReturnValue(sgENPlanCorrectReason,0));
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