
unit EditRQOrderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, DateUtils,
	EnergyproController, EnergyproController2, RQOrderController ;

type
  TfrmRQOrderFilterEdit = class(TDialogForm)

    lblNumberDoc : TLabel;
    edtNumberDoc: TEdit;
    lblNumberProject : TLabel;
    edtNumberProject: TEdit;
    lblOrderPeriod : TLabel;
    edtOrderPeriod: TDateTimePicker;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
  edtENDepartmentDepartmentRefName : TEdit;
  edtENDepartmentBudgetRefName : TEdit;
  edtRQOrderTypeRqOrderTypeName : TEdit;
  edtRQOrderFormRqOrderFormName : TEdit;
  edtRQOrderResourceRqOrderResourceName : TEdit;
  

  HTTPRIORQOrder: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENDepartmentDepartmentRefName: TLabel;
    lblENDepartmentBudgetRefName: TLabel;
    lblRQOrderTypeRqOrderTypeName: TLabel;
    lblRQOrderFormRqOrderFormName: TLabel;
    lblRQOrderResourceRqOrderResourceName: TLabel;
    spbENDepartmentDepartmentRef: TSpeedButton;
    spbENDepartmentBudgetRef: TSpeedButton;
    spbRQOrderTypeRqOrderType: TSpeedButton;
    spbRQOrderFormRqOrderForm: TSpeedButton;
    spbRQOrderResourceRqOrderResource: TSpeedButton;
    lblStatus: TLabel;
    edtStatusName: TEdit;
    spbStatus: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edtDateGen2: TDateTimePicker;
    lblENResponsibles: TLabel;
    edtENResponsibles: TEdit;
    spbENResponsibles: TSpeedButton;
    spbENResponsiblesClear: TSpeedButton;
    lblCreationMethod: TLabel;
    cbCreationMethod: TComboBox;
    lblTKTransportRealTransportRealName: TLabel;
    edtTKTransportRealTransportRealName: TEdit;
    spbTKTransportRealTransportReal: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentRefClick(Sender : TObject);
  procedure spbENDepartmentBudgetRefClick(Sender : TObject);
  procedure spbRQOrderTypeRqOrderTypeClick(Sender : TObject);
  procedure spbRQOrderFormRqOrderFormClick(Sender : TObject);
  procedure spbRQOrderResourceRqOrderResourceClick(Sender : TObject);
    procedure edtOrderPeriodExit(Sender: TObject);
    procedure spbENResponsiblesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENResponsiblesClearClick(Sender: TObject);
    procedure spbTKTransportRealTransportRealClick(Sender: TObject);

  private
    { Private declarations }
    responsibleCode: Integer;
    tktransportRealCode : Integer;
  public
    { Public declarations }

end;

var
  frmRQOrderFilterEdit: TfrmRQOrderFilterEdit;
  RQOrderFilterObj: RQOrderFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  //,ShowENDepartment
  //,ENDepartmentController
  ,ShowRQOrderType
  ,RQOrderTypeController
  ,ShowRQOrderForm
  ,RQOrderFormController
  ,ShowRQOrderResource
  ,RQOrderResourceController
, ENDepartmentTypeController, ENConsts, ShowENResponsibles,
  RQOrderCreationMethodController, ShowTKTransportReal,
  TKTransportRealController;

{uses  
    EnergyproController, EnergyproController2, RQOrderController  ;
}
{$R *.dfm}



procedure TfrmRQOrderFilterEdit.FormShow(Sender: TObject);

begin
   DisableControls([edtTKTransportRealTransportRealName]);
   tktransportRealCode:=LOW_INT;
   edtorderPeriod.DateTime := now;
   edtorderPeriod.Checked := false;

   edtDateGen.DateTime := now;
   edtDateGen.Checked := false;

   edtDateGen2.DateTime := now;
   edtDateGen2.Checked := false;

   //edtStatusName.Text := '';

   
{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtOrderPeriod
      ,edtDateGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberDoc.Text := RQOrderObj.numberDoc; 



    edtNumberProject.Text := RQOrderObj.numberProject; 



      if RQOrderObj.orderPeriod <> nil then
      begin
        edtOrderPeriod.DateTime:=EncodeDate(RQOrderObj.orderPeriod.Year,RQOrderObj.orderPeriod.Month,RQOrderObj.orderPeriod.Day);
        edtOrderPeriod.checked := true;
      end
      else
      begin
        edtOrderPeriod.DateTime:=SysUtils.Date;
        edtOrderPeriod.checked := false;
      end;



      if RQOrderObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(RQOrderObj.dateGen.Year,RQOrderObj.dateGen.Month,RQOrderObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;



    edtCommentGen.Text := RQOrderObj.commentGen; 



    edtUserGen.Text := RQOrderObj.userGen; 



      if RQOrderObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQOrderObj.dateEdit.Year,RQOrderObj.dateEdit.Month,RQOrderObj.dateEdit.Day);
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



procedure TfrmRQOrderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrder: RQOrderControllerSoapPort;
    condition : String;
begin

  if (ModalResult = mrOk)  then
  begin
     condition := '';

     RQOrderFilterObj.numberDoc := edtNumberDoc.Text;



     RQOrderFilterObj.numberProject := edtNumberProject.Text;


     if edtOrderPeriod.Checked then
     begin
       if RQOrderFilterObj.orderPeriod = nil then
         RQOrderFilterObj.orderPeriod := TXSDate.Create;
       RQOrderFilterObj.orderPeriod.XSToNative(GetXSDate(edtorderPeriod.DateTime));
     end
     else
       RQOrderFilterObj.orderPeriod := nil;

     if edtDateGen.checked then
     begin
       AddCondition(condition, ' rqorder.dategen >= to_date(''' + DateToStr(edtDateGen.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if edtDateGen2.checked then
     begin
       AddCondition(condition, ' rqorder.dategen <= to_date(''' + DateToStr(edtDateGen2.Date) + ''', ''dd.MM.yyyy'')');
     end;

     if responsibleCode > LOW_INT then
     begin
       AddCondition(condition, ' rqorder.code in (select oi.orderrefcode from rqorderitem oi ' +
                                                 ' where oi.responsiblesrefcode = ' + IntToStr(responsibleCode) + ')');
     end;

     if tktransportRealCode > LOW_INT then
     begin
       AddCondition(condition, ' rqorder.code in (select oi.orderrefcode from rqorderitem oi , rqorderitem2enestimttm oi2ei , enestimateitem ei , enplanwork p ' +
       ' where oi.code=oi2ei.orderitemcode ' +
       ' and oi2ei.estimateitemcode=ei.code ' +
       ' and ei.planrefcode=p.code ' +
       ' and p.elementrefcode in (select rrr.enelementcode from tktransportreal rrr where rrr.code = '+ IntToStr(tktransportRealCode) +'))' );
     end;

     if cbCreationMethod.ItemIndex > 0 then
     begin
       RQOrderFilterObj.creationMethodRef := RQOrderCreationMethodRef.Create;
       RQOrderFilterObj.creationMethodRef.code := cbCreationMethod.ItemIndex;
     end;

     RQOrderFilterObj.conditionSQL := condition;

{
     if edtdateGen.Checked then
     begin
       if RQOrderFilterObj.dateGen = nil then
         RQOrderFilterObj.dateGen := TXSDate.Create;
       RQOrderFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       RQOrderFilterObj.dateGen := nil;
}



{

     if RQOrderFilterObj.dateGen = nil then
        RQOrderFilterObj.dateGen := TXSDate.Create;
      RQOrderFilterObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));




     RQOrderFilterObj.commentGen := edtCommentGen.Text; 



     RQOrderFilterObj.userGen := edtUserGen.Text; 



     if RQOrderFilterObj.dateEdit = nil then
        RQOrderFilterObj.dateEdit := TXSDate.Create;
      RQOrderFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
}




  end;
end;

procedure TfrmRQOrderFilterEdit.spbENDepartmentDepartmentRefClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if RQOrderFilterObj.departmentRef = nil then RQOrderFilterObj.departmentRef := ENDepartment.Create();
               RQOrderFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentRefName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;


procedure TfrmRQOrderFilterEdit.spbENDepartmentBudgetRefClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin

   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal,f);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderFilterObj.budgetRef = nil then RQOrderFilterObj.budgetRef := ENDepartment.Create();
               //RQOrderObj.departmentRef.code := StrToInt(GetReturnValue(sgENDepartment,0));
               //edtENDepartmentDepartmentRefName.Text:=GetReturnValue(sgENDepartment,1);
               RQOrderFilterObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentBudgetRefName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;


procedure TfrmRQOrderFilterEdit.spbRQOrderTypeRqOrderTypeClick(Sender : TObject);
var 
   frmRQOrderTypeShow: TfrmRQOrderTypeShow;
begin
   frmRQOrderTypeShow:=TfrmRQOrderTypeShow.Create(Application,fmNormal);
   try
      with frmRQOrderTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderFilterObj.rqOrderType = nil then RQOrderFilterObj.rqOrderType := RQOrderType.Create();
               RQOrderFilterObj.rqOrderType.code := StrToInt(GetReturnValue(sgRQOrderType,0));
               edtRQOrderTypeRqOrderTypeName.Text:=GetReturnValue(sgRQOrderType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrderTypeShow.Free;
   end;
end;


procedure TfrmRQOrderFilterEdit.spbTKTransportRealTransportRealClick(
  Sender: TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   f : TKTransportRealFilter;
begin
   f := TKTransportRealFilter.Create;
   SetNullIntProps(f);
   SetNullIntProps(f);

   

   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal, f);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               tktransportRealCode := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealTransportRealName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;

procedure TfrmRQOrderFilterEdit.spbRQOrderFormRqOrderFormClick(Sender : TObject);
var 
   frmRQOrderFormShow: TfrmRQOrderFormShow;
begin
   frmRQOrderFormShow:=TfrmRQOrderFormShow.Create(Application,fmNormal);
   try
      with frmRQOrderFormShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderFilterObj.rqOrderForm = nil then RQOrderFilterObj.rqOrderForm := RQOrderForm.Create();
               RQOrderFilterObj.rqOrderForm.code := StrToInt(GetReturnValue(sgRQOrderForm,0));
               edtRQOrderFormRqOrderFormName.Text:=GetReturnValue(sgRQOrderForm,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrderFormShow.Free;
   end;
end;


procedure TfrmRQOrderFilterEdit.spbRQOrderResourceRqOrderResourceClick(Sender : TObject);
var 
   frmRQOrderResourceShow: TfrmRQOrderResourceShow;
begin
   frmRQOrderResourceShow:=TfrmRQOrderResourceShow.Create(Application,fmNormal);
   try
      with frmRQOrderResourceShow do
        if ShowModal = mrOk then
        begin
            try
               if RQOrderFilterObj.rqOrderResource = nil then RQOrderFilterObj.rqOrderResource := RQOrderResource.Create();
               RQOrderFilterObj.rqOrderResource.code := StrToInt(GetReturnValue(sgRQOrderResource,0));
               edtRQOrderResourceRqOrderResourceName.Text:=GetReturnValue(sgRQOrderResource,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrderResourceShow.Free;
   end;
end;





procedure TfrmRQOrderFilterEdit.edtOrderPeriodExit(Sender: TObject);
var
tmpDate : TDateTime;
begin
  inherited;
  tmpDate := edtOrderPeriod.DateTime ; //EncodeDate(ENActObj.dateGen.Year,ENActObj.dateGen.Month,ENActObj.dateGen.Day);
  edtOrderPeriod.DateTime := EncodeDate( YearOf(tmpDate) , MonthOf(tmpDate) ,1); ; //firstDay(tmpDate);
end;

procedure TfrmRQOrderFilterEdit.spbENResponsiblesClick(Sender: TObject);
var
  frmENResponsiblesShow: TfrmENResponsiblesShow;
begin
  frmENResponsiblesShow := TfrmENResponsiblesShow.Create(Application, fmNormal);
  try
    frmENResponsiblesShow.DisableActions([frmENResponsiblesShow.actInsert,
                                          frmENResponsiblesShow.actEdit,
                                          frmENResponsiblesShow.actDelete]);
    with frmENResponsiblesShow do
      if ShowModal = mrOk then
      begin
        try
          //if ENResponsibles2FINContractsObj.responsiblesRef = nil then ENResponsibles2FINContractsObj.responsiblesRef := ENResponsiblesRef.Create();
          //ENResponsibles2FINContractsObj.responsiblesRef.code := StrToInt(GetReturnValue(sgENResponsibles,0));
          responsibleCode := StrToInt(GetReturnValue(sgENResponsibles, 0));
          //responsibleName := GetReturnValue(sgENResponsibles, 1);
          edtENResponsibles.Text := GetReturnValue(sgENResponsibles, 1);
        except
          on EConvertError do Exit;
        end;
     end;
  finally
    frmENResponsiblesShow.Free;
  end;
end;

procedure TfrmRQOrderFilterEdit.FormCreate(Sender: TObject);
begin
  responsibleCode := LOW_INT;
end;

procedure TfrmRQOrderFilterEdit.spbENResponsiblesClearClick(
  Sender: TObject);
begin
  responsibleCode := LOW_INT;
  edtENResponsibles.Text := '';
end;

end.
