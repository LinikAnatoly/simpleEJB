
unit EditENTransportOrderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportOrderController ;

type
  TfrmENTransportOrderFilterEdit = class(TDialogForm)

    lblNumbergen : TLabel;
    edtNumbergen: TMemo;

    lblTimeStart : TLabel;
    edtTimeStart: TDateTimePicker;
    lblTimeFinal : TLabel;
    edtTimeFinal: TDateTimePicker;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblIsAssignment : TLabel;
    edtIsAssignment: TEdit;

    lblIsApproved : TLabel;
    edtIsApproved: TEdit;

    lblIsRejected : TLabel;
    edtIsRejected: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;


  lblENTransportOrderStatusTransportOrderStatusName : TLabel;
  edtENTransportOrderStatusTransportOrderStatusName : TEdit;
  spbENTransportOrderStatusTransportOrderStatus : TSpeedButton;
  
  lblTKTransportRealTransportRealName : TLabel;
  edtTKTransportRealTransportRealName : TEdit;
  spbTKTransportRealTransportReal : TSpeedButton;
  

  HTTPRIOENTransportOrder: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTransportOrderStatusTransportOrderStatusClick(Sender : TObject);
  procedure spbTKTransportRealTransportRealClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransportOrderFilterEdit: TfrmENTransportOrderFilterEdit;
  ENTransportOrderFilterObj: ENTransportOrderFilter;

implementation

uses
  ShowENTransportOrderStatus
  ,ENTransportOrderStatusController
  ,ShowTKTransportReal
  ,TKTransportRealController
;

{uses  
    EnergyproController, EnergyproController2, ENTransportOrderController  ;
}
{$R *.dfm}



procedure TfrmENTransportOrderFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtNumbergen.Lines, ENTransportOrderObj.numbergen);



      if ENTransportOrderObj.timeStart <> nil then
      begin
        edtTimeStart.DateTime:=EncodeDate(ENTransportOrderObj.timeStart.Year,ENTransportOrderObj.timeStart.Month,ENTransportOrderObj.timeStart.Day);
        edtTimeStart.checked := true;
      end
      else
      begin
        edtTimeStart.DateTime:=SysUtils.Date;
        edtTimeStart.checked := false;
      end;	  



      if ENTransportOrderObj.timeFinal <> nil then
      begin
        edtTimeFinal.DateTime:=EncodeDate(ENTransportOrderObj.timeFinal.Year,ENTransportOrderObj.timeFinal.Month,ENTransportOrderObj.timeFinal.Day);
        edtTimeFinal.checked := true;
      end
      else
      begin
        edtTimeFinal.DateTime:=SysUtils.Date;
        edtTimeFinal.checked := false;
      end;	  



      if ENTransportOrderObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENTransportOrderObj.dateStart.Year,ENTransportOrderObj.dateStart.Month,ENTransportOrderObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;	  



      if ENTransportOrderObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENTransportOrderObj.dateFinal.Year,ENTransportOrderObj.dateFinal.Month,ENTransportOrderObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;	  



    if ( ENTransportOrderObj.isAssignment <> Low(Integer) ) then
       edtIsAssignment.Text := IntToStr(ENTransportOrderObj.isAssignment)
    else
       edtIsAssignment.Text := '';



    if ( ENTransportOrderObj.isApproved <> Low(Integer) ) then
       edtIsApproved.Text := IntToStr(ENTransportOrderObj.isApproved)
    else
       edtIsApproved.Text := '';



    if ( ENTransportOrderObj.isRejected <> Low(Integer) ) then
       edtIsRejected.Text := IntToStr(ENTransportOrderObj.isRejected)
    else
       edtIsRejected.Text := '';



    MakeMultiline(edtCommentGen.Lines, ENTransportOrderObj.commentGen);



      if ENTransportOrderObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENTransportOrderObj.dateEdit.Year,ENTransportOrderObj.dateEdit.Month,ENTransportOrderObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtUserGen.Text := ENTransportOrderObj.userGen; 


  end;

}

end;



procedure TfrmENTransportOrderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportOrder: ENTransportOrderControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENTransportOrderFilterObj.numbergen := edtNumbergen.Text; 



     if edttimeStart.checked then
     begin 
       if ENTransportOrderFilterObj.timeStart = nil then
          ENTransportOrderFilterObj.timeStart := TXSDateTime.Create;
       ENTransportOrderFilterObj.timeStart.XSToNative(GetXSDate(edttimeStart.DateTime));
     end
     else
       ENTransportOrderFilterObj.timeStart := nil;



     if edttimeFinal.checked then
     begin 
       if ENTransportOrderFilterObj.timeFinal = nil then
          ENTransportOrderFilterObj.timeFinal := TXSDateTime.Create;
       ENTransportOrderFilterObj.timeFinal.XSToNative(GetXSDate(edttimeFinal.DateTime));
     end
     else
       ENTransportOrderFilterObj.timeFinal := nil;



     if edtdateStart.checked then
     begin 
       if ENTransportOrderFilterObj.dateStart = nil then
          ENTransportOrderFilterObj.dateStart := TXSDateTime.Create;
       ENTransportOrderFilterObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENTransportOrderFilterObj.dateStart := nil;



     if edtdateFinal.checked then
     begin 
       if ENTransportOrderFilterObj.dateFinal = nil then
          ENTransportOrderFilterObj.dateFinal := TXSDateTime.Create;
       ENTransportOrderFilterObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENTransportOrderFilterObj.dateFinal := nil;



     if ( edtIsAssignment.Text <> '' ) then
       ENTransportOrderFilterObj.isAssignment := StrToInt(edtIsAssignment.Text)
     else
       ENTransportOrderFilterObj.isAssignment := Low(Integer) ;




     if ( edtIsApproved.Text <> '' ) then
       ENTransportOrderFilterObj.isApproved := StrToInt(edtIsApproved.Text)
     else
       ENTransportOrderFilterObj.isApproved := Low(Integer) ;




     if ( edtIsRejected.Text <> '' ) then
       ENTransportOrderFilterObj.isRejected := StrToInt(edtIsRejected.Text)
     else
       ENTransportOrderFilterObj.isRejected := Low(Integer) ;




     ENTransportOrderFilterObj.commentGen := edtCommentGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENTransportOrderFilterObj.dateEdit = nil then
          ENTransportOrderFilterObj.dateEdit := TXSDateTime.Create;
       ENTransportOrderFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENTransportOrderFilterObj.dateEdit := nil;



     ENTransportOrderFilterObj.userGen := edtUserGen.Text; 




  end;
end;

procedure TfrmENTransportOrderFilterEdit.spbENTransportOrderStatusTransportOrderStatusClick(Sender : TObject);
var 
   frmENTransportOrderStatusShow: TfrmENTransportOrderStatusShow;
begin
   frmENTransportOrderStatusShow:=TfrmENTransportOrderStatusShow.Create(Application,fmNormal);
   try
      with frmENTransportOrderStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportOrderFilterObj.transportOrderStatus = nil then ENTransportOrderFilterObj.transportOrderStatus := ENTransportOrderStatus.Create();
               ENTransportOrderFilterObj.transportOrderStatus.code := StrToInt(GetReturnValue(sgENTransportOrderStatus,0));
               edtENTransportOrderStatusTransportOrderStatusName.Text:=GetReturnValue(sgENTransportOrderStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTransportOrderStatusShow.Free;
   end;
end;


procedure TfrmENTransportOrderFilterEdit.spbTKTransportRealTransportRealClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportOrderFilterObj.transportReal = nil then ENTransportOrderFilterObj.transportReal := TKTransportReal.Create();
               ENTransportOrderFilterObj.transportReal.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealTransportRealName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;





end.