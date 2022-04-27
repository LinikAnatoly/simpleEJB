unit PrintBindingSelectedNode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DateUtils, DMReportsUnit,DialogFormUnit,
  CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock,
  ImgList, ActnList, GridHeadersUnit, ExtCtrls;


type
  TfrmPrintBindingSelectedNode = class(TDialogForm)
    lblDateServices: TLabel;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtFactDateConnStart: TDateTimePicker;
    edtFactDateConnEnd: TDateTimePicker;
    edtDateTUStart: TDateTimePicker;
    edtDateTUEnd: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintBindingSelectedNode: TfrmPrintBindingSelectedNode;

implementation

{$R *.dfm}

procedure TfrmPrintBindingSelectedNode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if ModalResult = mrOk then
    begin
        if edtFactDateConnStart.Date > edtFactDateConnEnd.Date then
        begin
          Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
          Exit;
        end;

         if edtDateTUStart.Date > edtDateTUEnd.Date then
        begin
          Application.MessageBox('Дати повинні бути в хронологічній послідовності', 'Помилка', MB_ICONWARNING + MB_OK);
          Exit;
        end;

        if ((edtFactDateConnStart.Checked) and (edtDateTUStart.Checked)) or
            ((edtFactDateConnEnd.Checked) and (edtDateTUEnd.Checked)) then
        begin
          Application.MessageBox('Пошук повинен бути по (Факт дата підключ.) або (Дата ТУ)', 'Помилка', MB_ICONWARNING + MB_OK);
          Exit;
        end;
    end;      //if ModalResult = mrOk then
end;

procedure TfrmPrintBindingSelectedNode.FormShow(Sender: TObject);
begin
  edtFactDateConnEnd.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtFactDateConnStart.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);
  edtDateTUEnd.Date :=  EncodeDate(YearOf(Now), MonthOf(Now), DaysInMonth(Now));
  edtDateTUStart.Date := EncodeDate(YearOf(Now), MonthOf(Now), 1);

  edtFactDateConnEnd.Checked := false;
  edtFactDateConnStart.Checked := false;
  edtDateTUEnd.Checked := false;
  edtDateTUStart.Checked := false;
end;

end.
