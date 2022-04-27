unit EditChooseFINWorker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, XSBuiltIns, FINWorkerController;

type
  TfrmChoooseFINWorkerEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    edtFINWorkerName: TEdit;
    spbFINWorker: TSpeedButton;
    edtFINWorkerTabNumber: TEdit;
    lblFINWorker: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbFINWorkerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Filter : FINWorkerFilter;
    departmentCode : WideString;
	dateGet : TXSDate;
    { Private declarations }
  public
    { Public declarations }
    FINWorkerObj : FINWorkerShort;

    constructor Create(AOwner: TComponent;
                       State: TDialogState;
					   dateGet : TXSDate;
                       AFilter: FINWorkerFilter = nil); reintroduce; overload;
    constructor Create(AOwner: TComponent;
                       State: TDialogState;
					   dateGet : TXSDate;
                       departmentCode : WideString); reintroduce; overload;

  end;

var
  frmChoooseFINWorkerEdit: TfrmChoooseFINWorkerEdit;

implementation

uses DMReportsUnit, ENConsts, ChildFormUnit,
     ShowFINWorker, ENPlanWorkController, FINWorkerKindController ,
  ENWorkOrderBytController;

{$R *.dfm}

constructor TfrmChoooseFINWorkerEdit.Create(AOwner: TComponent; State: TDialogState;
                              dateGet : TXSDate;
                              AFilter: FINWorkerFilter = nil);
begin
  inherited Create(AOwner, State);
  Self.Filter := AFilter;
end;

constructor TfrmChoooseFINWorkerEdit.Create(AOwner: TComponent; State: TDialogState;
                              dateGet : TXSDate;
                              departmentCode : WideString);
begin
  inherited Create(AOwner, State);
  Self.departmentCode := departmentCode;
end;

procedure TfrmChoooseFINWorkerEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOK then begin
    if not NoBlankValues([edtFINWorkerName]) then
    begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end
  end;
end;

procedure TfrmChoooseFINWorkerEdit.spbFINWorkerClick(
  Sender: TObject);
  var
  selectedObj: FINWorkerShort;
begin
  inherited;
  if Assigned(Self.Filter) then begin
    selectedObj := TfrmFINWorkerShow.chooseFromList(Self.dateGet, Self.Filter);
  end else if Length(Trim(Self.departmentCode)) > 0 then begin
    selectedObj := TfrmFINWorkerShow.chooseFromList(Self.dateGet, Self.departmentCode);
  end else begin
    selectedObj := TfrmFINWorkerShow.chooseFromList(Self.dateGet);
  end;
  if Assigned(selectedObj) then begin
    edtFINWorkerTabNumber.Text :=  selectedObj.tabNumber;
    edtFINWorkerName.Text := selectedObj.name;
    FINWorkerObj := selectedObj;
  end;
end;

procedure TfrmChoooseFINWorkerEdit.FormCreate(Sender: TObject);
begin
  inherited;
  FINWorkerObj := nil;
end;

procedure TfrmChoooseFINWorkerEdit.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtFINWorkerTabNumber, edtFINWorkerName]);
end;

end.
