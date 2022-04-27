unit AverageCountPersonal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,DialogFormUnit, StdCtrls, ComCtrls, InvokeRegistry, Rio,
  SOAPHTTPClient, Buttons, Grids, BaseGrid, AdvGrid, AdvObj;

type
  TfrmAverageCountPersonal = class(TDialogForm)
    grpCalculate: TGroupBox;
    edtCalculateDate: TDateTimePicker;
    lblCalculateDate: TLabel;
    btnOk: TButton;
    HTTPRIOENAverageCountPersonal: THTTPRIO;
    grpReportExecute: TGroupBox;
    lblReportDataStart: TLabel;
    edtReportDataStart: TDateTimePicker;
    lblReportDataEnd: TLabel;
    edtReportDataEnd: TDateTimePicker;
    btnGenerateReport: TBitBtn;
    sgAverageCountPersonal: TAdvStringGrid;
    Label1: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGenerateReportClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmAverageCountPersonal: TfrmAverageCountPersonal;
  AverageCountPersonalHeaders: array [1..2] of String =
        ( '' ,
          'Місяць Рік'
        );

implementation

uses
  ENAverageCountPersonalController, XSBuiltIns, EnergyproController, 
  DMReportsUnit, GridHeadersUnit;

{$R *.dfm}

procedure TfrmAverageCountPersonal.btnOkClick(Sender: TObject);
var TempAverageCountPersonal: ENAverageCountPersonalControllerSoapPort;
      ENAverageCountPersonalObj: ENAverageCountPersonal;
begin
   if not NoBlankValues([edtCalculateDate])  then
  begin
      Application.MessageBox(PChar('Необхідно вказати місяць та рік для розрахунку!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      Exit;
  end;

      TempAverageCountPersonal := HTTPRIOENAverageCountPersonal as ENAverageCountPersonalControllerSoapPort;

      ENAverageCountPersonalObj:=ENAverageCountPersonal.Create;


        if edtcalculateDate.checked then
     begin 
       if ENAverageCountPersonalObj.calculateDate = nil then
          ENAverageCountPersonalObj.calculateDate := TXSDate.Create;
          ENAverageCountPersonalObj.calculateDate.XSToNative(GetXSDate(edtcalculateDate.DateTime));
     end
     else
       ENAverageCountPersonalObj.calculateDate := nil;


      try
      TempAverageCountPersonal.calculateAverageCountPersonal(ENAverageCountPersonalObj);
      finally
      ENAverageCountPersonalObj.Free;
      FormShow(Sender);
      end;

end;

procedure TfrmAverageCountPersonal.FormShow(Sender: TObject);
var
   TempAverageCountPersonal: EnAverageCountPersonalControllerSoapPort;
  i , LastCount , LastRow: Integer;
  AverageCountPersonalList: ENAverageCountPersonalShortList;
begin
    SetGridHeaders(AverageCountPersonalHeaders, sgAverageCountPersonal.ColumnHeaders);
    DenyBlankValues([edtCalculateDate ]);

    TempAverageCountPersonal :=  HTTPRIOEnAverageCountPersonal as EnAverageCountPersonalControllerSoapPort;
    AverageCountPersonalList := TempAverageCountPersonal.getListCalculatedPeriod();

    LastCount:=High(AverageCountPersonalList.list);

  if LastCount > -1 then
     sgAverageCountPersonal.RowCount:=LastCount+2
  else
     sgAverageCountPersonal.RowCount:=2;

   with sgAverageCountPersonal do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        Cells[1,i+1] := AverageCountPersonalList.list[i].nameCeh;
        LastRow:=i+1;
        sgAverageCountPersonal.RowCount:=LastRow+1;
      end;

   sgAverageCountPersonal.Row:=1;

end;

procedure TfrmAverageCountPersonal.btnGenerateReportClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  inherited;
      SetLength(argNames, 2);
      SetLength(args, 2);

      argNames[0] := 'datastart';
      args[0] := DateToStr( edtReportDataStart.date );

      argNames[1] := 'dataend';
      args[1] := DateToStr( edtReportDataEnd.date );

      reportName := 'Personal/averageCountPersonal';

      makeReport(reportName , argNames , args , 'xls');
end;

end.
