unit EditCountNPZForGraphDay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls , DialogFormUnit ;

type
  TfrmCountNPZForGraphDayEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    rgCountPlanWork: TRadioGroup;
    shpCount1: TShape;
    shpCount2: TShape;
    shpCount3: TShape;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCountNPZForGraphDayEdit: TfrmCountNPZForGraphDayEdit;

implementation

{$R *.dfm}

procedure TfrmCountNPZForGraphDayEdit.btnCancelClick(Sender: TObject);
begin
ModalResult:= mrNone;
end;

procedure TfrmCountNPZForGraphDayEdit.btnOkClick(Sender: TObject);
begin
 ModalResult:= mrOk;
end;

end.
