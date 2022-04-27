unit EditSCCounterUninstall;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DialogFormUnit, SCCounterController;

type
  TfrmSCCounterUninstallEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    edtInvNumber: TEdit;
    lblInvNumber: TLabel;
    lblPlanItem: TLabel;
    edtPlanItem: TEdit;
    spbPlanItem: TSpeedButton;
    spbSCCounter: TSpeedButton;
    edtTabNumber: TEdit;
    spbTabNumber: TSpeedButton;
    lblTabNumber: TLabel;
    lblPhasity: TLabel;
    cbbPhasity: TComboBox;
    spbPlanItemClear: TSpeedButton;
    spbTabNumberClear: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbPlanItemClearClick(Sender: TObject);
    procedure spbPlanItemClick(Sender: TObject);
    procedure spbSCCounterClick(Sender: TObject);
    procedure cbbPhasityChange(Sender: TObject);
    procedure spbTabNumberClick(Sender: TObject);
    procedure spbTabNumberClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure SetKartaRefCode(code : Integer; name : String);
    procedure SetTabNumber(tabNumber : String; name : String);
    { Private declarations }
  public
    counter : SCCounter;
    tabNumber : String;
    kartaRefCode : Integer;
    planCode : Integer;
constructor Create(AOwner: TComponent;
                       state: TDialogState); reintroduce; overload;

    { Public declarations }
  end;

var
  frmSCCounterUninstallEdit: TfrmSCCounterUninstallEdit;

implementation

uses ENPlanWorkItemController, ENPlanWorkController, ShowENPlanWorkItem
, ENEstimateItemController, ShowScanCounters, ScanCountersController, FINWorkerController
, ShowFINWorker, XSBuiltIns;

{$R *.dfm}

constructor TfrmSCCounterUninstallEdit.Create(AOwner: TComponent; state: TDialogState);
begin
  inherited Create(AOwner, state);
  Self.counter := nil;
  Self.SetKartaRefCode(Low(Integer), '');
  Self.SetTabNumber('', '');
end;

procedure TfrmSCCounterUninstallEdit.cbbPhasityChange(Sender: TObject);
begin
  if Assigned(Self.counter) then begin
    Self.counter.phasity := TXSDecimal.Create;
    Self.counter.phasity.DecimalString := cbbPhasity.Text;
  end;
end;

procedure TfrmSCCounterUninstallEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (ModalResult = mrOk) and (DialogState in [dsEdit, dsInsert]) then begin
    if not Assigned(Self.counter) then begin
      Action := caNone;
      raise Exception.Create('ќбер≥ть л≥чильник!');
    end;
    if not Assigned(Self.counter.phasity) then begin
      Action := caNone;
      raise Exception.Create('ќбер≥ть фазн≥сть л≥чильника!');
    end;
    Self.counter.estimateItemRef := ENEstimateItemRef.Create;
    Self.counter.estimateItemRef.code := StrToInt(counter.phasity.DecimalString);
  end;
end;

procedure TfrmSCCounterUninstallEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtInvNumber, edtPlanItem, edtTabNumber, cbbPhasity]);
end;

procedure TfrmSCCounterUninstallEdit.SetTabNumber(tabNumber : String; name : String);
begin
  Self.tabNumber := tabNumber;
  edtTabNumber.Text := name;
end;

procedure TfrmSCCounterUninstallEdit.SetKartaRefCode(code : Integer; name : String);
begin
  Self.kartaRefCode := code;
  Self.edtPlanItem.Text := name;
end;

procedure TfrmSCCounterUninstallEdit.spbPlanItemClearClick(Sender: TObject);
begin
  Self.SetKartaRefCode(Low(Integer), '');
end;

procedure TfrmSCCounterUninstallEdit.spbPlanItemClick(Sender: TObject);
var
planItem : ENPlanWorkItemController.ENPlanWorkItemShort;
filter : ENPlanWorkItemFilter;
begin
  filter := ENPlanWorkItemFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.planRef := ENPlanWorkRef.Create;
  filter.planRef.code := planCode;
  planItem := TfrmENPlanWorkItemShow.chooseFromList(filter);
  if Assigned(planItem) then begin
    Self.SetKartaRefCode(planItem.kartaRefCode, planItem.kartaNum + ' '+ planItem.kartaRefName);
  end;

end;

procedure TfrmSCCounterUninstallEdit.spbSCCounterClick(Sender: TObject);
var
selectedObj : ScanCountersShort;
begin
  inherited;
  selectedObj := TfrmScanCountersShow.chooseFromList;
  if not Assigned(selectedObj) then begin
    Exit;
  end;
  Self.counter := SCCounter.Create;
  SetNullIntProps(Self.counter);
  SetNullXSProps(Self.counter);
  Self.counter.scCode := selectedObj.num_un;
  Self.counter.invNumber := selectedObj.invNumber;
  Self.counter.molCode := selectedObj.mol;
  Self.counter.buildNumber := selectedObj.serialnumber;
  Self.counter.counterType := selectedObj.type_counter;
  Self.counter.phasity := selectedObj.phasity;
  Self.counter.isLiquid := 1;
  if (Self.counter.phasity <> nil) then begin
    DisableControls([cbbPhasity]);
    cbbPhasity.Text := counter.phasity.DecimalString;
  end else begin
    DisableControls([cbbPhasity], false);
  end;
  edtInvNumber.Text := counter.invNumber;
end;


procedure TfrmSCCounterUninstallEdit.spbTabNumberClearClick(Sender: TObject);
begin
  Self.SetTabNumber('', '');
end;

procedure TfrmSCCounterUninstallEdit.spbTabNumberClick(Sender: TObject);
var
  selectedObj : FINWorkerShort;
begin
  selectedObj := TfrmFINWorkerShow.chooseFromList(nil);
  if Assigned(selectedObj) then begin
    Self.SetTabNumber(selectedObj.tabNumber, selectedObj.name);
  end;
end;

end.
