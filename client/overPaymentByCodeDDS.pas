unit overPaymentByCodeDDS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid , DialogFormUnit,
  tmsAdvGridExcel;

type
  TfrmoverPaymentByCodeDDS = class(TDialogForm)
    sgOverPayment: TAdvStringGrid;
    btnOk: TButton;
    aeExcel: TAdvGridExcelIO;
    Button1: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmoverPaymentByCodeDDS: TfrmoverPaymentByCodeDDS;

  overPaymentHeaders: array [1..7] of String =
        (
         ' '
        ,'Код ДДС'
        ,'Назва ДДС'
        ,'Сума прийнята по ДДС(грн.)'
        ,'Оплати по ДДС(грн.) '
        ,'Запланована оплата по ДДС(грн.)'
        ,'Сума переплати(грн.)'

          );

implementation

uses GridHeadersUnit, Globals , ShellAPI;

{$R *.dfm}

procedure TfrmoverPaymentByCodeDDS.btnOkClick(Sender: TObject);
begin
 Self.Close;
end;

procedure TfrmoverPaymentByCodeDDS.Button1Click(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin


  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName('Оплати_по_кодам_ДДС' + '_') + '.xls';
    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmoverPaymentByCodeDDS.FormShow(Sender: TObject);
begin
  sgOverPayment.Options := sgOverPayment.Options - [goColMoving];

  SetGridHeaders(overPaymentHeaders, sgOverPayment.ColumnHeaders);
end;

end.
