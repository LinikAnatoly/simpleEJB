unit reportTransportPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , ChildFormUnit, Buttons, StdCtrls, ShowENTransportDepartment,
  ENTransportDepartmentController , DialogFormUnit, EnergyproController,
  DMReportsUnit, TKTransportClassificationController,
  ShowTKTransportClassification, ShowENDepartment, ENDepartmentController,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, CheckLst,
  EditENTransportDepartment, ComCtrls ;

type
  TfrmReportTransportPlan = class(TDialogForm)
    lblTransportDepartment: TLabel;
    edtENTransportDepartmentName: TEdit;
    spbENTransportDepartment: TSpeedButton;
    spbENTransportDepartmentClear: TSpeedButton;
    lblTKTransportClassification: TLabel;
    btnTKTransportClassification: TSpeedButton;
    edtTKTransportClassification: TEdit;
    lblMonthGen: TLabel;
    lblYearGen: TLabel;
    cbbYearGen: TComboBox;
    cbbMonthGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    RadioGroup1: TRadioGroup;
    ListTransportDepartment: TCheckListBox;
    HTTPRIOTENDepartment: THTTPRIO;
    HTTPRIOENTransportDepartment: THTTPRIO;
    Label1: TLabel;
    lblDateStart: TLabel;
    edtDateStart: TDateTimePicker;
    procedure spbENTransportDepartmentClick(Sender: TObject);
    procedure spbENTransportDepartmentClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnTKTransportClassificationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
  private
    { Private declarations }
    transportRenCode ,renCode : Integer;
    renName : string;
    transportClassificationcode : Integer;
  public
    { Public declarations }
  end;

var
  frmReportTransportPlan: TfrmReportTransportPlan;

implementation

{$R *.dfm}

procedure TfrmReportTransportPlan.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName , strTransportDepartment: String;
  i:Integer;
begin

    SetLength(argNames, 8);
    SetLength(args, 8);

    argNames[0] := 'yearGen';
    args[0] :=  cbbYearGen.Text;

    argNames[1] := 'monthGen';
    args[1] :=  IntToStr(cbbMonthGen.ItemIndex + 1);

    argNames[2] := 'transportRenCode';
    // args[2] := IntToStr(transportRenCode);
   /// собираем строку кодов транспортных подразделений , если нету то всех
   For i:=0 to ListTransportDepartment.Count -1  do
    Begin
       if  ListTransportDepartment.Checked[i] then
        if strTransportDepartment <>  '' then
           strTransportDepartment := strTransportDepartment + ' , ' + IntToStr(  Integer(ListTransportDepartment.Items.Objects[i] ) )
         else
           strTransportDepartment := strTransportDepartment + IntToStr(  Integer( ListTransportDepartment.Items.Objects[i] ) ) ;

    End;

    if strTransportDepartment <> '' then
       args[2] :=  ' trr.transportdepartmntrfcd in (  ' + strTransportDepartment + ')'
       else
       args[2] := ' 1 = 1 ';

    argNames[3] := 'transportClassificationcode';
    args[3] := IntToStr(transportClassificationcode);


    argNames[4] := 'dek';
    args[4] := IntToStr( RadioGroup1.ItemIndex+1 );


    reportName := 'transport/transportPlan/transportPlanDek';




    if edtEPRenName.Visible=true then
    begin
     argNames[2] := 'RenCode';
     args[2] := IntToStr(RenCode);

     reportName := 'transport/transportPlan/transportPlanObjDek';
    end;

    if edtDateStart.Visible=true then
    begin
     argNames[5] := 'datestart';
     args[5] := DateToStr( edtDateStart.date );

     reportName := 'transport/transportPlan/transportInRepair';
    end;



    makeReport(reportName, argNames, args, 'xlsx');


 end;


procedure TfrmReportTransportPlan.btnTKTransportClassificationClick(
  Sender: TObject);
var
   frmTKTransportClassificationShow: TfrmTKTransportClassificationShow;
begin
   frmTKTransportClassificationShow:=TfrmTKTransportClassificationShow.Create(Application,fmNormal);
   try
      with frmTKTransportClassificationShow do
        if ShowModal = mrOk then
        begin
            try
               transportClassificationcode := StrToInt(GetReturnValue(sgTKTransportClassification,0));
               edtTKTransportClassification.Text:=GetReturnValue(sgTKTransportClassification,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportClassificationShow.Free;
   end;
end;

procedure TfrmReportTransportPlan.FormCreate(Sender: TObject);
begin
  SetComboBoxCurrentYearWithStart(cbbYearGen, 2009, 2);
  SetComboBoxCurrentMonth(cbbMonthGen);


end;

procedure TfrmReportTransportPlan.FormShow(Sender: TObject);
var
departmentfilter: ENTransportDepartmentFilter;
TempENTransportDepartment: ENTransportDepartmentControllerSoapPort;
ENTransportDepartmentList: ENTransportDepartmentShortList;
tranDep: Integer;
begin
  edtENTransportDepartmentName.Enabled:= False;
  edtTKTransportClassification.Enabled:= False;
  transportClassificationcode:=-1;
  transportRenCode:= -1;
  renCode:= -1;

  // заполняем список транспортных подразделений

     departmentfilter := ENTransportDepartmentFilter.Create;
     SetNullIntProps(departmentfilter);
     SetNullXSProps(departmentfilter);
     departmentfilter.conditionSQL := ' code in ( select distinct trr.transportdepartmntrfcd from tktransportreal trr where trr.transportstatuscode=75000000 ) ';

     TempENTransportDepartment :=  HTTPRIOENTransportDepartment as ENTransportDepartmentControllerSoapPort;
     ENTransportDepartmentList := TempENTransportDepartment.getScrollableFilteredList(departmentfilter,0,-1);
     ListTransportDepartment.Items.Clear;

     for tranDep:=0 to High(ENTransportDepartmentList.list) do
      begin

        ListTransportDepartment.Items.AddObject(ENTransportDepartmentList.list[tranDep].name
         , TObject( ENTransportDepartmentList.list[tranDep].code )  );
      end;
end;

procedure TfrmReportTransportPlan.spbENTransportDepartmentClearClick(
  Sender: TObject);
begin

  renName := '';


  transportRenCode := -1;
  edtENTransportDepartmentName.Text := '';
end;

procedure TfrmReportTransportPlan.spbENTransportDepartmentClick(
  Sender: TObject);
var
   frmENTransportDepartmentShow: TfrmENTransportDepartmentShow;
   f : ENTransportDepartmentFilter;
begin
   f := ENTransportDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin
        DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try



               transportRenCode := StrToInt(GetReturnValue(sgENTransportDepartment,0));
               edtENTransportDepartmentName.Text:= GetReturnValue(sgENTransportDepartment,1);
               if transportRenCode = 10000 then
                renName := 'Апарат управління'
               else
                renName := GetReturnValue(sgENTransportDepartment,1);
//
//                 if ((rbSortTransport.Checked ) and (transportRenCode > 0 )) then
//                  begin
//                    chkshownotusetransport.Visible:= True;
//                    chkshownotusetransport.Checked:= True;
//                  end
//                  else
//                  begin
//                    chkshownotusetransport.Visible:= False;
//                    chkshownotusetransport.Checked:= False;
//                  end;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;

end;

procedure TfrmReportTransportPlan.spbEPRenClearClick(Sender: TObject);
begin
  inherited;
  renCode:= -1;
  edtEPRenName.Text:= '';
end;

procedure TfrmReportTransportPlan.spbEPRenClick(Sender: TObject);
var
frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

end.
