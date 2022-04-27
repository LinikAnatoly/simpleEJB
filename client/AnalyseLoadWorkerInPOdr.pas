unit AnalyseLoadWorkerInPOdr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,DialogFormUnit;

type
  TfrmFrmAnalyseLoadWorkerInPOdr = class(TDialogForm)
    Label1: TLabel;
    Label2: TLabel;
    lblENWorkerWorkerFactName: TLabel;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    edtENWorkerWorkerFactName: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    SpeedButton2: TSpeedButton;
    spbType: TSpeedButton;
    edtTypeName: TEdit;
    lblTypeName: TLabel;
    spbENPlanWorkStatus: TSpeedButton;
    edtENPlanWorkStatusName: TEdit;
    lblENPlanWorkStatusName: TLabel;
    SpeedButton1: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure spbENPlanWorkStatusClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode : Integer;
    renname : String;
    WorkTypeCode : integer;
    WorkTypeName : String;
    planstatuscode : Integer;
  end;

var
  frmFrmAnalyseLoadWorkerInPOdr: TfrmFrmAnalyseLoadWorkerInPOdr;

implementation

uses DMReportsUnit, EnergyproController, ShowENDepartment,
  ENDepartmentController, ChildFormUnit, ShowENPlanWorkState,
  ShowENPlanWorkStatus, ShowENPlanWorkType, ENPlanWorkStateController,
  ENPlanWorkStatusController;

{$R *.dfm}

procedure TfrmFrmAnalyseLoadWorkerInPOdr.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  var ys,ms,ds,yf,mf,df: Word;
begin

      if(not edtDateStart.Checked) then
      begin
          Application.MessageBox(PChar('Оберіть дату початку!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);

          Exit;
      end;

        if(not edtDateFinal.Checked) then
      begin
          Application.MessageBox(PChar('Оберіть дату закінчення!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);

          Exit;
      end;

      if(edtDateFinal.Date < edtDateStart.Date) then
      begin
          Application.MessageBox(PChar('Дати повинні бути в хронологічному порядку!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);

          Exit;
      end;

      DecodeDate(edtDateStart.date,ys,ms,ds);
      DecodeDate(edtDateFinal.date,yf,mf,df);



      SetLength(argNames, 7);
      SetLength(args, 7);

      argNames[0] := 'datestart';
      args[0] := DateToStr( edtDateStart.date );

      argNames[1] := 'datefinal';
      args[1] := DateToStr( edtDateFinal.date );

      argNames[2] := 'tabnumber';
      args[2] := edtENWorkerWorkerFactName.Text;

      argNames[3] := 'podrcode';
      args[3]  := IntToStr(renCode);

      argNames[4] := 'podrname';
      args[4]  := renname;

      argNames[5] := 'typerefcode';
      args[5]  := IntToStr( WorkTypeCode);

      argNames[6] := 'planstatus';
      args[6]  := IntToStr( planstatuscode);

        reportName := 'AnalysLoadPersByPodr';
        makeReport(reportName, argNames, args, 'xlsx')


end;

procedure TfrmFrmAnalyseLoadWorkerInPOdr.FormShow(Sender: TObject);
begin
    renCode :=1;
    renname :='Всі підрозділи';
    WorkTypeCode :=0;
    WorkTypeName :='';
    planstatuscode :=0;
    DisableControls([edtEPRenName,edtTypeName,edtENPlanWorkStatusName]);
end;

procedure TfrmFrmAnalyseLoadWorkerInPOdr.spbENPlanWorkStatusClick(
  Sender: TObject);
var
   frmENPlanWorkStatusShow: TfrmENPlanWorkStatusShow;
   statusPlanF : ENPlanWorkStatusFilter;
begin

   statusPlanF := ENPlanWorkStatusFilter.Create;
   SetNullIntProps(statusPlanF);
   SetNullXSProps(statusPlanF);

   statusPlanF.conditionSQL := ' code in (1,3) ';
   frmENPlanWorkStatusShow:=TfrmENPlanWorkStatusShow.Create(Application,fmNormal,statusPlanF);
   try
      with frmENPlanWorkStatusShow do
        if ShowModal = mrOk then
        begin
            try
               planstatuscode := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               edtENPlanWorkStatusName.Text:=GetReturnValue(sgENPlanWorkStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPlanWorkStatusShow.Free;
   end;
end;

procedure TfrmFrmAnalyseLoadWorkerInPOdr.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 1;
  renName := 'Всі підрозділи';
  edtEPRenName.Text := '';

end;

procedure TfrmFrmAnalyseLoadWorkerInPOdr.spbEPRenClick(Sender: TObject);
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

procedure TfrmFrmAnalyseLoadWorkerInPOdr.spbTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;

begin
   frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkTypeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtTypeName.Text:= GetReturnValue(sgENPlanWorkType,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               WorkTypeCode :=   StrToInt(GetReturnValue(sgENPlanWorkType,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkTypeShow.Free;
   end;
end;

procedure TfrmFrmAnalyseLoadWorkerInPOdr.SpeedButton1Click(Sender: TObject);
begin
 planstatuscode := 0;
 edtENPlanWorkStatusName.Text:='';
end;

procedure TfrmFrmAnalyseLoadWorkerInPOdr.SpeedButton2Click(Sender: TObject);
begin
  WorkTypeCode := 0 ;
  WorkTypeName := ' ' ;
  edtTypeName.Text := '' ;
end;

end.
