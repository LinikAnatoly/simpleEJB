unit EditBindCounterToENServicesObject;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesObjectController
  , SCMolController
  , ScanCountersController;

type
  TfrmBindCounterToENServicesObjectEdit = class(TDialogForm)
    //lblRpCode : TLabel;
    //edtRpCode: TEdit;


  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;

  btnOk: TButton;
  btnCancel: TButton;
    spbChooseSCMol: TSpeedButton;
    edtSCMol: TEdit;
    lblEPRenRenName: TLabel;
    edtSCCounter: TEdit;
    Label1: TLabel;
    spbChooseCounter: TSpeedButton;
    chkIgnorePrice: TCheckBox;
    spbDropSCMol: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbChooseCounterClick(Sender: TObject);
    procedure spbChooseSCMolClick(Sender: TObject);
    procedure spbDropSCMolClick(Sender: TObject);

  private
    counter : ScanCountersShort;
    mol : SCMolShort;
    servicesObject : ENServicesObject;

    { Private declarations }
  public
    procedure SetServicesObject(servicesObject : ENServicesObject);
    function GetServicesObject : ENServicesObject;
    function GetCounter : ScanCountersShort;
    function GetMol : SCMolShort;
    function GetIgnorePrice : Boolean;
    { Public declarations }

end;

var
  frmBindCounterToENServicesObjectEdit: TfrmBindCounterToENServicesObjectEdit;

implementation

uses ShowScanCounters, ShowSCMol;


{$R *.dfm}



procedure TfrmBindCounterToENServicesObjectEdit.FormShow(Sender: TObject);

begin
DisableControls([edtSCCounter, edtSCMol]);

end;



procedure TfrmBindCounterToENServicesObjectEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  if (ModalResult = mrOk)  then
  begin
  end;
end;

procedure TfrmBindCounterToENServicesObjectEdit.SetServicesObject(servicesObject : ENServicesObject); begin
  Self.servicesObject := servicesObject;
end;
procedure TfrmBindCounterToENServicesObjectEdit.spbChooseCounterClick(
  Sender: TObject);
var selectedCounter : ScanCountersShort;
begin
  inherited;
  selectedCounter := TfrmScanCountersShow.chooseFromList;
  if Assigned(selectedCounter) then begin
    Self.counter := selectedCounter;
    edtSCCounter.Text := Self.counter.invNumber + ' ' + Self.counter.name;
  end;
end;

procedure TfrmBindCounterToENServicesObjectEdit.spbChooseSCMolClick(
  Sender: TObject);
  var selectedMol : SCMolShort;
begin
  inherited;
  selectedMol := TfrmSCMolShow.chooseFromList;
  if Assigned(selectedMol) then begin
    Self.mol := selectedMol;
    edtSCMol.Text := Self.mol.kod_mol + ' ' + Self.mol.name_mol;
  end;
end;

procedure TfrmBindCounterToENServicesObjectEdit.spbDropSCMolClick(
  Sender: TObject);
begin
  inherited;
  Self.mol := nil;
  edtSCMol.Text := '';
end;

function TfrmBindCounterToENServicesObjectEdit.GetServicesObject : ENServicesObject; begin
  Result := Self.servicesObject;
end;

function TfrmBindCounterToENServicesObjectEdit.GetCounter : ScanCountersShort; begin
  Result := Self.counter;
end;

function TfrmBindCounterToENServicesObjectEdit.GetMol : SCMolShort; begin
  Result := Self.mol;
end;
function TfrmBindCounterToENServicesObjectEdit.GetIgnorePrice : Boolean; begin
  Result := chkIgnorePrice.Checked;
end;

end.