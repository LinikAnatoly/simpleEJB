unit WorkedTimeByHuman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls , ENPlanWorkController, ENHumenItemController,
  XSBuiltIns;

  
type
  TfrmWorkedTimeByHuman = class(TDialogForm)
    Label1: TLabel;
    edtDateStart: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    lblENWorkerWorkerFactName: TLabel;
    edtENWorkerWorkerFactName: TEdit;
    spbENWorkerWorkerFact: TSpeedButton;
    spbFINWorkerClear: TSpeedButton;
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENWorkerWorkerFactClick(Sender: TObject);
  private
    { Private declarations }
  public
    renCode: Integer;
    renName: String;
    pplankind : Integer;
    report_vid : Integer;

    ENPlanWorkObj: ENPlanWork;
    { Public declarations }
  end;

var
  frmWorkedTimeByHuman: TfrmWorkedTimeByHuman;
  ENHumenItemObj: ENHumenItem;
  vtabnumber : String;

implementation

{$R *.dfm}
 uses  FINExecutorController, ShowFINExecutor,
  ShowFINExecutorTree , ShowENDepartment , ENDepartmentController , ChildFormUnit , EnergyproController , DMReportsUnit
  , ENPlanWorkItemController, FINWorkerController,
  ShowFINWorker , ENConsts ,  FINWorkerKindController;

procedure TfrmWorkedTimeByHuman.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';

  
end;

procedure TfrmWorkedTimeByHuman.spbEPRenClick(Sender: TObject);
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

        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmWorkedTimeByHuman.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  var ys,ms,ds,yf,mf,df: Word;
begin
DecodeDate(edtDateStart.date,ys,ms,ds);
DecodeDate(edtDateFinal.date,yf,mf,df);




      SetLength(argNames, 3);
      SetLength(args, 3);

      argNames[0] := 'dateStart';
      args[0] := DateToStr( edtDateStart.date );

      argNames[1] := 'dateEnd';
      args[1] := DateToStr( edtDateFinal.date );

      argNames[2] := 'tabnumber';
      args[2] := vtabnumber;

        reportName := 'workedtimebyhuman';
        makeReportAuth(reportName, argNames, args, 'xls')

    

end;

procedure TfrmWorkedTimeByHuman.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              ENPlanWorkObj.finExecutor :=
                DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                       DMReports.getFullExecutorName(tvDep.Selected));
            except
              on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmWorkedTimeByHuman.FormCreate(Sender: TObject);
begin
  report_vid:= 0; // сбрасываем вид отчета ... обычный вид или развернутый по персоналу
end;

procedure TfrmWorkedTimeByHuman.spbENWorkerWorkerFactClick(
  Sender: TObject);
var
  frmFINWorkerShow: TfrmFINWorkerShow;
  f: FINWorkerFilter;
begin
  /////
  // 20.10.15 Фильтранем по кривому табельному, чтобы открылся пустой список
  // (т.к. иначе запрос висит минут 20, потому что выбирает персонал без среза на дату,
  // чтобы выбирать также уже и уволенных людей)
  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.tabNumber := '-1';
  /////

  frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
  try
    frmFINWorkerShow.forReport := True;

    DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

    with frmFINWorkerShow do
      if ShowModal = mrOk then
      begin
        try
          edtENWorkerWorkerFactName.Text := GetReturnValue(sgFINWorker, 1);
          vtabnumber := GetReturnValue(sgFINWorker, 2);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmFINWorkerShow.Free;
  end;
end;

end.
