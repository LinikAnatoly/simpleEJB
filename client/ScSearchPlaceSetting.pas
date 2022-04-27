unit ScSearchPlaceSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit;

type
  TfrmScSearchPlaceSetting = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtInvNumber: TEdit;
    edtBuildNumber: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure edtInvNumberEnter(Sender: TObject);
    procedure edtBuildNumberEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmScSearchPlaceSetting: TfrmScSearchPlaceSetting;

implementation

{$R *.dfm}
uses EnergyproController , DMReportsUnit ;

procedure TfrmScSearchPlaceSetting.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
begin

if ( ( edtInvNumber.Text = '') and ( edtBuildNumber.Text = '' ))  then
  begin
      Application.MessageBox(PChar('Необхідно вказати інвентарний  або заводський номер!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end

  else
  begin

    SetLength(argNames, 2);
    SetLength(args, 2);


    argNames[0] := 'invnumber';
    if   trim(edtInvNumber.Text) <> '' then
    args[0] := trim(edtInvNumber.Text)
    else
    args[0] := '';

    argNames[1] := 'buildnumber';
    if   trim(edtBuildNumber.Text) <> '' then
    args[1] := trim(edtBuildNumber.Text)
    else
    args[1] := '';


    reportName := 'Counters/ScSearchPlaceSetting';

    makeReport(reportName, argNames, args, 'xls')
;

end;



end;

procedure TfrmScSearchPlaceSetting.edtInvNumberEnter(Sender: TObject);
begin
    edtBuildNumber.Text := '';
end;

procedure TfrmScSearchPlaceSetting.edtBuildNumberEnter(Sender: TObject);
begin
   edtInvNumber.Text := '';
end;

end.
