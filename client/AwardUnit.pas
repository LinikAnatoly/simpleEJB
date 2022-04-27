unit AwardUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,DialogFormUnit,
  Dialogs, StdCtrls, Buttons;

type
  TfrmAward = class(TDialogForm)
    cbYear: TComboBox;
    cbMon: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAward: TfrmAward;

implementation

{$R *.dfm}

procedure TfrmAward.FormShow(Sender: TObject);
var y,m,d:Word;
begin
DecodeDate(Date(),y,m,d);
cbYear.ItemIndex:=0;
 if y=2018 then cbYear.ItemIndex:=1;
 if y=2019 then cbYear.ItemIndex:=2;
 if y=2020 then cbYear.ItemIndex:=3;
 if y=2021 then cbYear.ItemIndex:=4;
 if y=2022 then cbYear.ItemIndex:=5;
 if y=2023 then cbYear.ItemIndex:=6;
 if y=2024 then cbYear.ItemIndex:=7;
 if y=2025 then cbYear.ItemIndex:=8;

 cbMon.ItemIndex:=m-1;

end;

end.
