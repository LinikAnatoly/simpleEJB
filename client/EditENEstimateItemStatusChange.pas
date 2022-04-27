unit EditENEstimateItemStatusChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls;

type
  TfrmENEstimateItemStatusChangeEdit = class(TDialogForm)
    cbENEstimateItemStatus: TComboBox;
    Label1: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENEstimateItemStatusChangeEdit: TfrmENEstimateItemStatusChangeEdit;

implementation

{$R *.dfm}

procedure TfrmENEstimateItemStatusChangeEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOK then
  begin
    //if (cbENEstimateItemStatus.ItemIndex = 1) or
    //   (cbENEstimateItemStatus.ItemIndex = 2) or
    //   (cbENEstimateItemStatus.ItemIndex = 3) then

    // Вручную можно ставить только статусы "Запланований", "Непотрібно замовляти" и "Власне виробництво"
    if not (cbENEstimateItemStatus.ItemIndex in [0, 4, 9]) then
    begin
      Application.MessageBox(PChar('Такий статус тут не ставиться !'), PChar('Увага !'), MB_ICONWARNING);
      Action := caNone;
      Exit;
    end;
  end;
end;

end.
