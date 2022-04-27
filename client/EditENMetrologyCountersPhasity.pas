unit EditENMetrologyCountersPhasity;

interface

uses
  Buttons, Controls, Classes, StdCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, DialogFormUnit, ComCtrls, CheckLst, InvokeRegistry, Rio,
  SOAPHTTPClient, Grids, BaseGrid, AdvGrid, TB2Item, TB2Dock, TB2Toolbar,
  ImgList, ActnList, GridHeadersUnit, DateUtils, AdvObj, XSBuiltIns, Generics.Collections;

const
  GRID_COLUMN_ONE_PHASITY = 3;
  GRID_COLUMN_THREE_PHASITY = 4;

type
  TfrmENMetrologyCountersPhasityEdit = class(TDialogForm)
    HTTPRIOTKMaterials: THTTPRIO;
    lblError: TLabel;
    gbScannedCounters: TGroupBox;
    tbActions: TTBToolbar;
    sgInvNumbers: TAdvStringGrid;
    ActionList1: TActionList;
    actDelete: TAction;
    actAllOnePhase: TAction;
    actAllThreePhase: TAction;
    ImageList1: TImageList;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    btnOk_: TButton;
    btnCancel_: TButton;
    HTTPRIOENMetrologyCounter: THTTPRIO;
    TBItem3: TTBItem;
    procedure FormCreate(Sender: TObject);
    procedure sgInvNumbersCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure actAllOnePhaseExecute(Sender: TObject);
    procedure actAllThreePhaseExecute(Sender: TObject);
    procedure btnCancel_Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBItem3Click(Sender: TObject);

  private
    { Private declarations }
    invNumList : TStringList;


  public
    { Public declarations }
    molCode : string;
    dateGen : TXSDate;
    rqPackingListCode : Integer;
    boxCode : Integer;
    isShowBoxes : Boolean;
    rqFKOrderCode : Integer;
    counters : TDictionary<String, Integer>;
    countersZones : TDictionary<String, Integer>;
    countersNames : TDictionary<String, String>;

  end;

var
  frmENMetrologyCountersPhasityEdit: TfrmENMetrologyCountersPhasityEdit;

  InvNumbersHeaders : array [1..4] of String =
        ( 'Код'
          , 'Інв. №'
          , 'Найменування'
          , 'Заводський'
        );



implementation
uses ChildFormUnit, ENConsts
     , EnergyproController, DMReportsUnit
     , SCCounterController
     , RQPackingListItemController
     , ENMetrologyCounterController
     , ShowRQBox
     , RQBoxController
     , RQFKOrderItemController;
{$R *.dfm}




procedure TfrmENMetrologyCountersPhasityEdit.actAllOnePhaseExecute(Sender: TObject);
begin
  inherited;
    checkGrid(sgInvNumbers, GRID_COLUMN_ONE_PHASITY, true);
    checkGrid(sgInvNumbers, GRID_COLUMN_THREE_PHASITY, false);
end;

procedure TfrmENMetrologyCountersPhasityEdit.actAllThreePhaseExecute(Sender: TObject);
begin
  inherited;
  checkGrid(sgInvNumbers, GRID_COLUMN_ONE_PHASITY, false);
  checkGrid(sgInvNumbers, GRID_COLUMN_THREE_PHASITY, true);
end;


procedure TfrmENMetrologyCountersPhasityEdit.btnCancel_Click(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmENMetrologyCountersPhasityEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i, phasity, zones : Integer;
  state_ : Boolean;
begin
  inherited;
    for i := 1 to sgInvNumbers.RowCount - 1 do begin
      if sgInvNumbers.Cells[1, i] <> '' then begin

        phasity := 0;
        sgInvNumbers.GetCheckBoxState(GRID_COLUMN_ONE_PHASITY, i, state_);
        if state_ then phasity := 1
        else begin
          sgInvNumbers.GetCheckBoxState(GRID_COLUMN_THREE_PHASITY, i, state_);
          if state_ then phasity := 3
          else if phasity = 0 then  begin
            Action := caNone;
            raise Exception.Create('Оберіть фазність для лічильника інв. № ' + sgInvNumbers.Cells[1, i]);
          end;
        end;
        if counters.ContainsKey(sgInvNumbers.Cells[1, i]) then begin
          counters.Remove(sgInvNumbers.Cells[1, i]);
        end;


        counters.Add(sgInvNumbers.Cells[1, i], phasity);
        if sgInvNumbers.Cells[5, i] <> '' then begin
            zones := StrToInt(sgInvNumbers.Cells[5, i]);
            if countersZones.ContainsKey(sgInvNumbers.Cells[1, i]) then begin
              countersZones.Remove(sgInvNumbers.Cells[1, i]);
            end;

        end else raise Exception.Create('Оберіть зонність для лічильника інв. № ' + sgInvNumbers.Cells[1, i]);


        countersZones.Add(sgInvNumbers.Cells[1, i], zones);
      end;
    end;

end;

procedure TfrmENMetrologyCountersPhasityEdit.FormCreate(Sender: TObject);
begin
  inherited;
  sgInvNumbers.RowCount := 2;
  Self.counters := TDictionary<String,Integer>.Create;
  Self.countersNames := TDictionary<String, String>.Create;
  Self.sgInvNumbers.DefaultEditor := edComboList;
  sgInvNumbers.ComboBox.AddItem('1', TObject(1));
  sgInvNumbers.ComboBox.AddItem('2', TObject(2));
  sgInvNumbers.ComboBox.AddItem('3', TObject(3));

end;

procedure TfrmENMetrologyCountersPhasityEdit.FormShow(Sender: TObject);
var
  i, k : Integer;
  invNumber, counterName : String;
begin
  inherited;
  for invNumber in countersNames.Keys do begin
      counterName := countersNames[invNumber];
      if sgInvNumbers.RowCount > 2 then
        k := sgInvNumbers.RowCount - 1
      else
        k := 1;

      sgInvNumbers.Cells[1, k] := invNumber;
      sgInvNumbers.Cells[2, k] := counterName;
      sgInvNumbers.Cells[5, k] := '1';
      sgInvNumbers.AddCheckBox(GRID_COLUMN_ONE_PHASITY, k, false, false);
      sgInvNumbers.AddCheckBox(GRID_COLUMN_THREE_PHASITY, k, false, false);
      sgInvNumbers.CellProperties[1, k].ReadOnly := True;
      sgInvNumbers.CellProperties[2, k].ReadOnly := True;
      sgInvNumbers.CellProperties[1, sgInvNumbers.RowCount].ReadOnly := True;
      sgInvNumbers.CellProperties[2, sgInvNumbers.RowCount].ReadOnly := True;

      sgInvNumbers.RowCount := sgInvNumbers.RowCount + 1;
      sgInvNumbers.Row := k;

  end;
end;

procedure TfrmENMetrologyCountersPhasityEdit.sgInvNumbersCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  inherited;
  if (ACol = GRID_COLUMN_ONE_PHASITY) then begin
    if State then
         sgInvNumbers.SetCheckBoxState(GRID_COLUMN_THREE_PHASITY, ARow, False);
  end;

  if (ACol = GRID_COLUMN_THREE_PHASITY) then begin
    if State then
      sgInvNumbers.SetCheckBoxState(GRID_COLUMN_ONE_PHASITY, ARow, False);
  end;

end;

procedure TfrmENMetrologyCountersPhasityEdit.TBItem3Click(Sender: TObject);
var
i : Integer;
strZones : String;
strZonesArray : TArray<String>;
norm : Boolean;
begin
  inherited;
  strZones := InputBox('EnergyNet', 'Введіть зонність', '1');
  strZonesArray := DMReports.getDefaultZones();
  norm := false;
  for i := 0 to Length(strZonesArray) - 1 do begin
      if(strZonesArray[i] = strZones) then begin
        norm := true;
      end;
  end;
  if not (norm) then begin
            raise Exception.Create('Неправильна зонність: ' + strZones);
  end;
     if Application.MessageBox(PChar('Ви дійсно бажаєте для всіх лічильників проставити зонність ' + strZones + ' ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    for i := 1 to sgInvNumbers.RowCount - 1 do begin
    if sgInvNumbers.Cells[1, i] <> '' then begin
      sgInvNumbers.Cells[5, i] := strZones;
    end;
    end;
  end;
end;

end.
