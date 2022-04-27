
unit EditENTransportOrder;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportOrderController ;

type
  TfrmENTransportOrderEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
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
  frmENTransportOrderEdit: TfrmENTransportOrderEdit;
  ENTransportOrderObj: ENTransportOrder;

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



procedure TfrmENTransportOrderEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENTransportOrderStatusTransportOrderStatusName
      ,spbENTransportOrderStatusTransportOrderStatus
      ,edtTKTransportRealTransportRealName
      ,spbTKTransportRealTransportReal
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTransportOrderObj.code);
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

    edtENTransportOrderStatusTransportOrderStatusName.Text := ENTransportOrderObj.transportOrderStatus.name;
    edtTKTransportRealTransportRealName.Text := ENTransportOrderObj.transportReal.name;

  end;
end;



procedure TfrmENTransportOrderEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportOrder: ENTransportOrderControllerSoapPort;
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
    TempENTransportOrder := HTTPRIOENTransportOrder as ENTransportOrderControllerSoapPort;


     ENTransportOrderObj.numbergen := edtNumbergen.Text; 

     if edttimeStart.checked then
     begin 
       if ENTransportOrderObj.timeStart = nil then
          ENTransportOrderObj.timeStart := TXSDateTime.Create;
       ENTransportOrderObj.timeStart.XSToNative(GetXSDate(edttimeStart.DateTime));
     end
     else
       ENTransportOrderObj.timeStart := nil;	   

     if edttimeFinal.checked then
     begin 
       if ENTransportOrderObj.timeFinal = nil then
          ENTransportOrderObj.timeFinal := TXSDateTime.Create;
       ENTransportOrderObj.timeFinal.XSToNative(GetXSDate(edttimeFinal.DateTime));
     end
     else
       ENTransportOrderObj.timeFinal := nil;	   

     if edtdateStart.checked then
     begin 
       if ENTransportOrderObj.dateStart = nil then
          ENTransportOrderObj.dateStart := TXSDateTime.Create;
       ENTransportOrderObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENTransportOrderObj.dateStart := nil;	   

     if edtdateFinal.checked then
     begin 
       if ENTransportOrderObj.dateFinal = nil then
          ENTransportOrderObj.dateFinal := TXSDateTime.Create;
       ENTransportOrderObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENTransportOrderObj.dateFinal := nil;	   

     if ( edtIsAssignment.Text <> '' ) then
       ENTransportOrderObj.isAssignment := StrToInt(edtIsAssignment.Text)
     else
       ENTransportOrderObj.isAssignment := Low(Integer) ;

     if ( edtIsApproved.Text <> '' ) then
       ENTransportOrderObj.isApproved := StrToInt(edtIsApproved.Text)
     else
       ENTransportOrderObj.isApproved := Low(Integer) ;

     if ( edtIsRejected.Text <> '' ) then
       ENTransportOrderObj.isRejected := StrToInt(edtIsRejected.Text)
     else
       ENTransportOrderObj.isRejected := Low(Integer) ;

     ENTransportOrderObj.commentGen := edtCommentGen.Text; 

     if edtdateEdit.checked then
     begin 
       if ENTransportOrderObj.dateEdit = nil then
          ENTransportOrderObj.dateEdit := TXSDateTime.Create;
       ENTransportOrderObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENTransportOrderObj.dateEdit := nil;	   

     ENTransportOrderObj.userGen := edtUserGen.Text; 

    if DialogState = dsInsert then
    begin
      ENTransportOrderObj.code:=low(Integer);
      TempENTransportOrder.add(ENTransportOrderObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTransportOrder.save(ENTransportOrderObj);
    end;
  end;
end;


procedure TfrmENTransportOrderEdit.spbENTransportOrderStatusTransportOrderStatusClick(Sender : TObject);
var 
   frmENTransportOrderStatusShow: TfrmENTransportOrderStatusShow;
begin
   frmENTransportOrderStatusShow:=TfrmENTransportOrderStatusShow.Create(Application,fmNormal);
   try
      with frmENTransportOrderStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportOrderObj.transportOrderStatus = nil then ENTransportOrderObj.transportOrderStatus := ENTransportOrderStatus.Create();
               ENTransportOrderObj.transportOrderStatus.code := StrToInt(GetReturnValue(sgENTransportOrderStatus,0));
               edtENTransportOrderStatusTransportOrderStatusName.Text:=GetReturnValue(sgENTransportOrderStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTransportOrderStatusShow.Free;
   end;
end;



procedure TfrmENTransportOrderEdit.spbTKTransportRealTransportRealClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
begin
   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportOrderObj.transportReal = nil then ENTransportOrderObj.transportReal := TKTransportReal.Create();
               ENTransportOrderObj.transportReal.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
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