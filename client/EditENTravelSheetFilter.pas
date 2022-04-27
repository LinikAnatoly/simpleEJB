
unit EditENTravelSheetFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
  	EnergyproController, EnergyproController2, ENTravelSheetController ;

type
  TfrmENTravelSheetFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblSpeedometerStart : TLabel;
    edtSpeedometerStart: TEdit;

    lblSpeedometerFinal : TLabel;
    edtSpeedometerFinal: TEdit;

    lblTimeStart : TLabel;
    edtTimeStart: TDateTimePicker;
    lblTimeFinal : TLabel;
    edtTimeFinal: TDateTimePicker;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;


  lblENDepartmentDepartmentName : TLabel;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;
  
  lblTKTransportRealTransportRealName : TLabel;
  edtTKTransportRealTransportRealName : TEdit;
  spbTKTransportRealTransportReal : TSpeedButton;
  
  lblFINWorkerFinWorkerName : TLabel;
  edtFINWorkerFinWorkerName : TEdit;
  spbFINWorkerFinWorker : TSpeedButton;
  

  HTTPRIOENTravelSheet: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENTravelSheetType: TLabel;
    cbTravelSheetType: TComboBox;
    lblENTravelSheetStatus: TLabel;
    edtENTravelSheetStatus: TEdit;
    spbENTravelSheetStatus: TSpeedButton;
    lblFinMolCode: TLabel;
    edtFinMolCode: TEdit;
    spbMOL: TSpeedButton;
    edtCode: TEdit;
    lblCode: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
  procedure spbTKTransportRealTransportRealClick(Sender : TObject);
  procedure spbFINWorkerFinWorkerClick(Sender : TObject);
    procedure spbENTravelSheetStatusClick(Sender: TObject);
    procedure spbMOLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    transportMolCode : Integer;
  public
    { Public declarations }

end;

var
  frmENTravelSheetFilterEdit: TfrmENTravelSheetFilterEdit;
  ENTravelSheetFilterObj: ENTravelSheetFilter;

implementation

uses
  ShowENDepartment
  ,ENDepartmentController
  ,ShowTKTransportReal
  ,TKTransportRealController
  ,ShowFINWorker
  ,FINWorkerController
  ,ENConsts, ENTravelSheetTypeController, DMReportsUnit
  , ENTravelSheetStatusController, ShowENTravelSheetStatus, ShowFINMol,
  FINMolController;

{uses
    EnergyproController, EnergyproController2, ENTravelSheetController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetFilterEdit.FormCreate(Sender: TObject);
begin
  inherited;
   transportMolCode := LOW_INT;
end;

procedure TfrmENTravelSheetFilterEdit.FormShow(Sender: TObject);
begin
  SetIntStyle([edtCode]);
  DisableControls([edtENDepartmentDepartmentName, edtTKTransportRealTransportRealName, edtFINWorkerFinWorkerName
    , edtENTravelSheetStatus, edtFinMolCode]);
end;



procedure TfrmENTravelSheetFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
   //TempENTravelSheet: ENTravelSheetControllerSoapPort;
   condition : String;

begin
  if (ModalResult = mrOk)  then
  begin

  try
   if Length(edtCode.Text) > 0 then ENTravelSheetFilterObj.code := StrToInt(edtCode.Text);
   except on EConvertError do begin
           ENTravelSheetFilterObj.code := LOW_INT;
      end;
   end;

     ENTravelSheetFilterObj.numberGen := edtNumberGen.Text;

     if  cbTravelSheetType.ItemIndex > -1 then
     begin
       if ENTravelSheetFilterObj.typeRef = nil then
          ENTravelSheetFilterObj.typeRef := ENTravelSheetTypeRef.Create();
       ENTravelSheetFilterObj.typeRef.code := cbTravelSheetType.ItemIndex + 1;
     end;

     condition := '';
     if edtdateStart.checked then
     begin
       AddCondition(condition, 'entravelsheet.datestart >= to_date(''' + DateToStr(edtdateStart.Date) + ''',''dd.MM.yyyy'')');
     end;

     if edtdateFinal.checked then
     begin
        AddCondition(condition, 'entravelsheet.datefinal <= to_date(''' + DateToStr(edtdateFinal.Date) + ''',''dd.MM.yyyy'')');
     end;


     if ENTravelSheetFilterObj.finWorker <> nil then
     begin
       ENTravelSheetFilterObj.finWorker.code := LOW_INT;
       AddCondition(condition, 'entravelsheet.finworkercode in (select f.code from finworker f where f.tabnumber = '''+
                    ENTravelSheetFilterObj.finWorker.tabNumber + ''')');
     end;

     if transportMolCode <> LOW_INT  then
        AddCondition(condition,'entravelsheet.transportrealcode in (select r.code from tktransportreal r where r.finmolcode = ''' + IntToStr(transportMolCode) + ''')');

     ENTravelSheetFilterObj.conditionSQL := condition;


  end;
end;

procedure TfrmENTravelSheetFilterEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin

  f:=  ENDepartmentFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.code := 1;
{
  if ENTravelSheetObj.department <> nil then
  begin
    f.code := ENTravelSheetObj.department.code;
  end;
}
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFilterObj.department = nil then ENTravelSheetFilterObj.department := ENDepartment.Create();
               ENTravelSheetFilterObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;


procedure TfrmENTravelSheetFilterEdit.spbTKTransportRealTransportRealClick(Sender : TObject);
var 
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   f : TKTransportRealFilter;
begin
   f := TKTransportRealFilter.Create;
   SetNullIntProps(f);
   SetNullIntProps(f);

   if  ENTravelSheetFilterObj.department <> nil then
   begin
       f.conditionSQL := 'tktransportreal.departmentrefcode in (' + DMReports.getDepartmentCodesDown( ENTravelSheetFilterObj.department.code ) + ')'
   end;

   frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal, f);
   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFilterObj.transportReal = nil then ENTravelSheetFilterObj.transportReal := TKTransportReal.Create();
               ENTravelSheetFilterObj.transportReal.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtTKTransportRealTransportRealName.Text:=GetReturnValue(sgTKTransportReal,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;


procedure TfrmENTravelSheetFilterEdit.spbFINWorkerFinWorkerClick(Sender : TObject);
var 
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   condition : string;
begin

   f :=FINWorkerFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

  // + типа только водители ???
  // MDAX-441
  if DMReports.UsesMDAXData then
  begin
    condition := DMReports.getDriversConditionForAX();

    if ENTravelSheetFilterObj.department <> nil then
      AddCondition(condition , ' (hrmorganizationid in (' + DMReports.getAXDepartmentCodesDown(ENTravelSheetFilterObj.department.code) + '))');
  end
  else begin
    condition := 'ps.post_id in ' + FKVODILA_POST_ID;

    if ENTravelSheetFilterObj.department <> nil then
      AddCondition(condition , ' pd.Podr_Id in (' + DMReports.getDepartmentCodesDown(ENTravelSheetFilterObj.department.code) + ' )');
  end;

   f.conditionSQL := condition;

   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal, f);

      if edtDateStart.Checked then
      begin
         frmFINWorkerShow.dateGet := TXSDate.Create;
         frmFINWorkerShow.dateGet.XSToNative(GetXSDate(edtDateStart.DateTime));
      end
     else
       frmFINWorkerShow.dateGet := nil;

   try
      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFilterObj.finWorker = nil then ENTravelSheetFilterObj.finWorker := FINWorker.Create();
               //ENTravelSheetFilterObj.finWorker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               ENTravelSheetFilterObj.finWorker.tabNumber := GetReturnValue(sgFINWorker,2);
               edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;


procedure TfrmENTravelSheetFilterEdit.spbMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

  molSel : boolean;

begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do
      begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               transportMolCode := StrToInt(GetReturnValue(sgFINMol,0));
               edtFinMolCode.Text := IntToStr(transportMolCode) + ' ' + GetReturnValue(sgFINMol,1);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;

procedure TfrmENTravelSheetFilterEdit.spbENTravelSheetStatusClick(Sender: TObject);
var 
   frmENTravelSheetStatusShow : TfrmENTravelSheetStatusShow;
begin
   frmENTravelSheetStatusShow := TfrmENTravelSheetStatusShow.Create(Application,fmNormal);
   try
      with frmENTravelSheetStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTravelSheetFilterObj.statusRef = nil then ENTravelSheetFilterObj.statusRef := ENTravelSheetStatusRef.Create();
               ENTravelSheetFilterObj.statusRef.code := StrToInt(GetReturnValue(sgENTravelSheetStatus,0));
               edtENTravelSheetStatus.Text := GetReturnValue(sgENTravelSheetStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTravelSheetStatusShow.Free;
   end;
end;


end.