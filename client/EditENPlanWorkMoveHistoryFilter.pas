
unit EditENPlanWorkMoveHistoryFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkMoveHistoryController ;

type
  TfrmENPlanWorkMoveHistoryFilterEdit = class(TDialogForm)

    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblYearGen : TLabel;
    edtYearGen: TEdit;
    lblMonthGen : TLabel;
    edtMonthGen: TEdit;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblENPlanWorkMoveReasonName : TLabel;
  edtENPlanWorkMoveReasonName: TEdit;
  spbENPlanWorkMoveReason: TSpeedButton;
  

  HTTPRIOENPlanWorkMoveHistory: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPlanWorkMoveReasonClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENPlanWorkMoveHistoryFilterEdit: TfrmENPlanWorkMoveHistoryFilterEdit;
  ENPlanWorkMoveHistoryFilterObj: ENPlanWorkMoveHistoryFilter;

implementation

uses
  ShowENPlanWorkMoveReason
  ,ENPlanWorkMoveReasonController
;

{uses  
    EnergyproController, EnergyproController2, ENPlanWorkMoveHistoryController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkMoveHistoryFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtYearGen
      ,edtMonthGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENPlanWorkMoveHistoryObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPlanWorkMoveHistoryObj.dateGen.Year,ENPlanWorkMoveHistoryObj.dateGen.Month,ENPlanWorkMoveHistoryObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    if ( ENPlanWorkMoveHistoryObj.yearGen <> Low(Integer) ) then
       edtYearGen.Text := IntToStr(ENPlanWorkMoveHistoryObj.yearGen)
    else
       edtYearGen.Text := '';



    if ( ENPlanWorkMoveHistoryObj.monthGen <> Low(Integer) ) then
       edtMonthGen.Text := IntToStr(ENPlanWorkMoveHistoryObj.monthGen)
    else
       edtMonthGen.Text := '';



    edtCommentGen.Text := ENPlanWorkMoveHistoryObj.commentGen; 



    edtUserGen.Text := ENPlanWorkMoveHistoryObj.userGen; 



      if ENPlanWorkMoveHistoryObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanWorkMoveHistoryObj.dateEdit.Year,ENPlanWorkMoveHistoryObj.dateEdit.Month,ENPlanWorkMoveHistoryObj.dateEdit.Day);
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



procedure TfrmENPlanWorkMoveHistoryFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ENPlanWorkMoveHistoryFilterObj.dateGen = nil then
        ENPlanWorkMoveHistoryFilterObj.dateGen := TXSDate.Create;
      ENPlanWorkMoveHistoryFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));




     if ( edtYearGen.Text <> '' ) then
       ENPlanWorkMoveHistoryFilterObj.yearGen := StrToInt(edtYearGen.Text)
     else
       ENPlanWorkMoveHistoryFilterObj.yearGen := Low(Integer) ;




     if ( edtMonthGen.Text <> '' ) then
       ENPlanWorkMoveHistoryFilterObj.monthGen := StrToInt(edtMonthGen.Text)
     else
       ENPlanWorkMoveHistoryFilterObj.monthGen := Low(Integer) ;




     ENPlanWorkMoveHistoryFilterObj.commentGen := edtCommentGen.Text; 



     ENPlanWorkMoveHistoryFilterObj.userGen := edtUserGen.Text; 



     if ENPlanWorkMoveHistoryFilterObj.dateEdit = nil then
        ENPlanWorkMoveHistoryFilterObj.dateEdit := TXSDate.Create;
      ENPlanWorkMoveHistoryFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));





  end;
end;

procedure TfrmENPlanWorkMoveHistoryFilterEdit.spbENPlanWorkMoveReasonClick(Sender : TObject);
var 
   frmENPlanWorkMoveReasonShow: TfrmENPlanWorkMoveReasonShow;
begin
   frmENPlanWorkMoveReasonShow:=TfrmENPlanWorkMoveReasonShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkMoveReasonShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkMoveHistoryFilterObj.reason = nil then ENPlanWorkMoveHistoryFilterObj.reason := ENPlanWorkMoveReason.Create();
               ENPlanWorkMoveHistoryFilterObj.reason.code := StrToInt(GetReturnValue(sgENPlanWorkMoveReason,0));
               edtENPlanWorkMoveReasonName.Text:=GetReturnValue(sgENPlanWorkMoveReason,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPlanWorkMoveReasonShow.Free;
   end;
end;





end.