unit FactStateGSM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons , DialogFormUnit, ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient, DateUtils;

type
  TfrmFactStateGSM = class(TDialogForm)
    Label4: TLabel;
    lblMonthRaznar: TLabel;
    dtpStartDate: TDateTimePicker;
    Label3: TLabel;
    dtpEndDate: TDateTimePicker;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    chkNotEnergosbyt: TCheckBox;
    chkGroupByTravelSheet: TCheckBox;
    lblENElementName: TLabel;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    edtENElementName: TEdit;
    lblTransportDepartment: TLabel;
    spbTransportDepartment: TSpeedButton;
    spbClearTransportDepartment: TSpeedButton;
    edtTransportDepartmentName: TEdit;
    lblFuelType: TLabel;
    spbFuelType: TSpeedButton;
    spbFuelTypeClear: TSpeedButton;
    edtFuelType: TEdit;
    lblTKTransportRealCode: TLabel;
    spbTKTransportReal: TSpeedButton;
    spbTKTransportRealClear: TSpeedButton;
    edtTKTransportReal: TEdit;
    HTTPRIOTKTransportReal: THTTPRIO;
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbTransportDepartmentClick(Sender: TObject);
    procedure spbClearTransportDepartmentClick(Sender: TObject);
    procedure spbFuelTypeClick(Sender: TObject);
    procedure spbFuelTypeClearClick(Sender: TObject);
    procedure spbTKTransportRealClearClick(Sender: TObject);
    procedure spbTKTransportRealClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
    transportDepartment : Integer;
    elementCode : Integer;
    elementName : String;
    transportDepartmentCode : Integer;
    fuelTypeCode : Integer;
    tktransportRealCode : Integer;
  end;

var
  frmFactStateGSM: TfrmFactStateGSM;

implementation

uses
  ENTransportDepartmentController, ShowENTransportDepartment,
  ShowENDepartment, ENDepartmentController,
  DMReportsUnit, EnergyproController,
  ShowENElement, ENElementController,
  ShowTKFuelType, TKFuelTypeController, TKTransportRealController,
  ShowTKTransportReal;

{$R *.dfm}

procedure TfrmFactStateGSM.spbEPRenClick(Sender: TObject);
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

procedure TfrmFactStateGSM.spbEPRenClearClick(Sender: TObject);
begin
  renCode := -1;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmFactStateGSM.FormClose(Sender: TObject; var Action: TCloseAction);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin
  inherited;

 if (ModalResult = mrOk) then
 begin

    if dtpStartDate.Checked = false then
    begin
      Application.MessageBox('Оберить дату початку', 'Помилка', MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    if dtpEndDate.Checked = false then
    begin
      Application.MessageBox('Оберить дату закінчення', 'Помилка', MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    if dtpStartDate.Date > dtpEndDate.Date then
    begin
      Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    if (  ( transportDepartmentCode = -1 ) and (ModalResult = mrOk) ) then
    begin
        renName := 'Всі підрозділи';
    end;

    SetLength(argNames, 10);
    SetLength(args, 10);

    argNames[0] := 'datestart';
    args[0] := DateToStr(dtpStartDate.DateTime);

    argNames[1] := 'datefinal';
    args[1] := DateToStr(dtpEndDate.DateTime);

    argnames[2]:= 'departmentrefcode';
    args[2] := IntToStr(renCode);

    argnames[3]:= 'departmentrefname';
    args[3] := renName;


    argnames[4]:= 'isnotenergozbyt';
    if chkNotEnergosbyt.Checked = true then
    args[4] := IntToStr(1);
    if chkNotEnergosbyt.Checked = false then
    args[4] := IntToStr(-1);

    argnames[5]:= 'groupByTravelSheet';
    if chkGroupByTravelSheet.Checked = True then
    args[5] := '1'
    else
    args[5] := '0';

     argnames[6] := 'elementCode';
     args[6] := IntToStr(elementCode);

     argnames[7] := 'transportDepartmentCode';
     args[7] := IntToStr(transportDepartmentCode);

          argnames[8] := 'fuelTypeCode';
     args[8] := IntToStr(fuelTypeCode);

              argnames[9] := 'tktransportRealCode';
     args[9] := IntToStr(tktransportRealCode);


    if chkGroupByTravelSheet.Checked = True then
     reportName := 'Auto/fact_state_gsm2/fs_objectNotGr'
    else
    reportName := 'Auto/fact_state_gsm2/fs_object' ;


    makeReport(reportName, argNames, args, 'xls');

 end;

end;

procedure TfrmFactStateGSM.FormCreate(Sender: TObject);
begin
    rencode := -1;
    elementCode := -1;
    transportDepartmentCode := -1;
    fuelTypeCode := -1;
    tktransportRealCode := -1;


    dtpEndDate.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
    dtpStartDate.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);

    dtpStartDate.Checked := true;
    dtpEndDate.Checked := true;


end;

procedure TfrmFactStateGSM.spbENElementClick(Sender: TObject);
var
   frmENElementShow: TfrmENElementShow;
   f : ENElementFilter;
   invNum , depName: String;
   depCode : Integer;
   depShort : ENDepartmentShort;
   //o : EN
begin
   f := ENElementFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.orderBySQL := 'typerefcode';
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin

            try
               elementCode := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text := GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmFactStateGSM.spbENElementClearClick(Sender: TObject);
begin
  elementCode := -1;
  elementName := '';
  edtENElementName.Text := '';
end;

procedure TfrmFactStateGSM.spbTransportDepartmentClick(Sender: TObject);
var
   frmENTransportDepartmentShow : TfrmENTransportDepartmentShow;
begin
   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin

        if ShowModal = mrOk then
        begin
               edtTransportDepartmentName.Text := GetReturnValue(sgENTransportDepartment,1);
               transportDepartmentCode := StrToInt(GetReturnValue(sgENTransportDepartment,0));
               renName := GetReturnValue(sgENTransportDepartment,1);
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;

end;


procedure TfrmFactStateGSM.spbClearTransportDepartmentClick(
  Sender: TObject);
begin
  transportDepartmentCode := -1;
  edtTransportDepartmentName.Text := '';
end;

procedure TfrmFactStateGSM.spbFuelTypeClick(Sender: TObject);
var
    frmTKFuelTypeShow: TfrmTKFuelTypeShow;
   //f : TKFuelTypeFilter;
begin
  //f := ENDepartmentFilter.Create;
  // SetNullIntProps(f);
  // SetNullXSProps(f);
  // f.code := 1;

   frmTKFuelTypeShow:=TfrmTKFuelTypeShow.Create(Application,fmNormal);
   try
      with frmTKFuelTypeShow do begin

        if ShowModal = mrOk then
        begin

          fuelTypeCode := StrToInt(GetReturnValue(sgTKFuelType,0));
          edtFuelType.Text := GetReturnValue(sgTKFuelType,1);
        end;
      end;
   finally
      frmTKFuelTypeShow.Free;
   end;


end;

procedure TfrmFactStateGSM.spbFuelTypeClearClick(Sender: TObject);
begin
  inherited;
  edtFuelType.Text := '';
  fuelTypeCode := -1;
end;

procedure TfrmFactStateGSM.spbTKTransportRealClearClick(Sender: TObject);
begin
  inherited;
  edtTKTransportReal.Text := '';
  tktransportRealCode := -1;
end;

procedure TfrmFactStateGSM.spbTKTransportRealClick(Sender: TObject);
var
   frmTKTransportRealShow: TfrmTKTransportRealShow;
   TempTKTransportReal: TKTransportRealControllerSoapPort;
   trReal : TKTransportReal;
begin
  frmTKTransportRealShow:=TfrmTKTransportRealShow.Create(Application,fmNormal);
          try
      with frmTKTransportRealShow do
      begin
       if ShowModal = mrOk then
      begin
          tktransportRealCode := StrToInt(GetReturnValue(sgTKTransportReal,0));
          edtTKTransportReal.Text := GetReturnValue(sgTKTransportReal,4);
      end;
      end;
      finally
          frmTKTransportRealShow.Free;
        end;
end;

end.
