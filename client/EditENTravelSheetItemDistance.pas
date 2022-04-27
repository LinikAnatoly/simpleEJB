
unit EditENTravelSheetItemDistance;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTravelSheetItemDistanceController,
  TB2Item, TB2Dock, TB2Toolbar, ENTravelSheetItemDistance2TKFuelKoefController,
  ShowTKFuelKoef, TKFuelKoefController, TKFuelKoefTypeController, ENConsts,
  AdvObj;

type
  TfrmENTravelSheetItemDistanceEdit = class(TDialogForm)


  HTTPRIOENTravelSheetItemDistance: THTTPRIO;
    pcEditENTravelSheetItemDistance: TPageControl;
    btnOk: TButton;
    btnCancel: TButton;
    tsTravelSheetItemDistance: TTabSheet;
    tsENTravelSheetItemDistance2TKFuelKoef: TTabSheet;
    lblDistance: TLabel;
    edtDistance: TEdit;
    lblSumMachineHours: TLabel;
    edtSumMachineHours: TEdit;
    lblKoef: TLabel;
    edtKoef: TEdit;
    edtCode: TEdit;
    lblCode: TLabel;
    TBToolbar3: TTBToolbar;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    TBItem13: TTBItem;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actInsert: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    sgENTravelSheetItemDistance2TKFuelKoef: TAdvStringGrid;
    HTTPRIOENTravelSheetItemDistance2TKFuelKoef: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure updateKoefGrid();
    procedure pcEditENTravelSheetItemDistanceChange(Sender: TObject);
    procedure TBItem13Click(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTravelSheetItemDistanceEdit: TfrmENTravelSheetItemDistanceEdit;
  ENTravelSheetItemDistanceObj: ENTravelSheetItemDistance;

    ENTravelSheetItemDistance2TKFuelKoefHeaders: array [1..3] of String =
        ( 'Код'
		  , 'Найменування'
		  , 'Коефіціент'
        );
   

implementation


{uses  
    EnergyproController, EnergyproController2, ENTravelSheetItemDistanceController  ;
}
{$R *.dfm}



procedure TfrmENTravelSheetItemDistanceEdit.FormShow(Sender: TObject);

begin

  pcEditENTravelSheetItemDistance.ActivePage := tsTravelSheetItemDistance;

  if (DialogState = dsInsert) then begin
    HideControls([lblCode, edtCode]);
    edtKoef.Text := '1';
    edtDistance.Text := '0';
    edtSumMachineHours.Text := '0';
    tsENTravelSheetItemDistance2TKFuelKoef.TabVisible := False;
  end;

  DisableControls([edtKoef, edtCode]);

  if DialogState = dsView then
  begin
     DisableActions([actDelete,  actInsert])
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDistance
      ,edtKoef
      ,edtSumMachineHours
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTravelSheetItemDistanceObj.code);
    if ( ENTravelSheetItemDistanceObj.distance <> nil ) then
       edtDistance.Text := ENTravelSheetItemDistanceObj.distance.decimalString
    else
       edtDistance.Text := ''; 
    if ( ENTravelSheetItemDistanceObj.sumMachineHours <> nil ) then
       edtSumMachineHours.Text := ENTravelSheetItemDistanceObj.sumMachineHours.decimalString
    else
       edtSumMachineHours.Text := ''; 
    if ( ENTravelSheetItemDistanceObj.koef <> nil ) then
       edtKoef.Text := ENTravelSheetItemDistanceObj.koef.decimalString
    else
       edtKoef.Text := '';


  end;
end;



procedure TfrmENTravelSheetItemDistanceEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTravelSheetItemDistance: ENTravelSheetItemDistanceControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDistance
      ,edtSumMachineHours
      ,edtKoef
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTravelSheetItemDistance := HTTPRIOENTravelSheetItemDistance as ENTravelSheetItemDistanceControllerSoapPort;


     if (ENTravelSheetItemDistanceObj.distance = nil ) then
       ENTravelSheetItemDistanceObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENTravelSheetItemDistanceObj.distance.decimalString := edtDistance.Text 
     else
       ENTravelSheetItemDistanceObj.distance := nil;

     if (ENTravelSheetItemDistanceObj.sumMachineHours = nil ) then
       ENTravelSheetItemDistanceObj.sumMachineHours := TXSDecimal.Create;
     if edtSumMachineHours.Text <> '' then
       ENTravelSheetItemDistanceObj.sumMachineHours.decimalString := edtSumMachineHours.Text 
     else
       ENTravelSheetItemDistanceObj.sumMachineHours := nil;

     if (ENTravelSheetItemDistanceObj.koef = nil ) then
       ENTravelSheetItemDistanceObj.koef := TXSDecimal.Create;
     if edtKoef.Text <> '' then
       ENTravelSheetItemDistanceObj.koef.decimalString := edtKoef.Text 
     else
       ENTravelSheetItemDistanceObj.koef := nil;

    if DialogState = dsInsert then
    begin
      ENTravelSheetItemDistanceObj.code:=low(Integer);
      TempENTravelSheetItemDistance.add(ENTravelSheetItemDistanceObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTravelSheetItemDistance.save(ENTravelSheetItemDistanceObj);
    end;
  end;
end;



procedure TfrmENTravelSheetItemDistanceEdit.pcEditENTravelSheetItemDistanceChange(
  Sender: TObject);
begin
  inherited;
  if pcEditENTravelSheetItemDistance.ActivePage = tsENTravelSheetItemDistance2TKFuelKoef then
  begin
     updateKoefGrid;
  end;
end;

procedure TfrmENTravelSheetItemDistanceEdit.TBItem13Click(Sender: TObject);
begin
  inherited;
  updateKoefGrid;
end;

procedure TfrmENTravelSheetItemDistanceEdit.updateKoefGrid();
var
  TempENTravelSheetItemDistance2TKFuelKoef: ENTravelSheetItemDistance2TKFuelKoefControllerSoapPort;
  i, LastCount, LastRow : Integer;
  ENTravelSheetItemDistance2TKFuelKoefList: ENTravelSheetItemDistance2TKFuelKoefShortList;
  tsid2fkFilter : ENTravelSheetItemDistance2TKFuelKoefFilter;
  begin
  ClearGrid(sgENTravelSheetItemDistance2TKFuelKoef);
  SetGridHeaders(ENTravelSheetItemDistance2TKFuelKoefHeaders, sgENTravelSheetItemDistance2TKFuelKoef.ColumnHeaders);
  TempENTravelSheetItemDistance2TKFuelKoef :=  HTTPRIOENTravelSheetItemDistance2TKFuelKoef as ENTravelSheetItemDistance2TKFuelKoefControllerSoapPort;

  if(ENTravelSheetItemDistanceObj.code = Low(Integer)) then Exit;

  tsid2fkFilter := ENTravelSheetItemDistance2TKFuelKoefFilter.Create;
  SetNullIntProps(tsid2fkFilter);
  SetNullXSProps(tsid2fkFilter);
  tsid2fkFilter.travelSheetItemDistanceRef := ENTravelSheetItemDistanceRef.Create;
  tsid2fkFilter.travelSheetItemDistanceRef.code := ENTravelSheetItemDistanceObj.code;

  ENTravelSheetItemDistance2TKFuelKoefList := TempENTravelSheetItemDistance2TKFuelKoef.getScrollableFilteredList(tsid2fkFilter,0,-1);


  LastCount:=High(ENTravelSheetItemDistance2TKFuelKoefList.list);

  if LastCount > -1 then
     sgENTravelSheetItemDistance2TKFuelKoef.RowCount:=LastCount+2
  else
     sgENTravelSheetItemDistance2TKFuelKoef.RowCount:=2;

   with sgENTravelSheetItemDistance2TKFuelKoef do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTravelSheetItemDistance2TKFuelKoefList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTravelSheetItemDistance2TKFuelKoefList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTravelSheetItemDistance2TKFuelKoefList.list[i].tkFuelKoefRefName;
        if(ENTravelSheetItemDistance2TKFuelKoefList.list[i].tkFuelKoefRefKoef <> nil) then
          Cells[2,i+1] := ENTravelSheetItemDistance2TKFuelKoefList.list[i].tkFuelKoefRefKoef.DecimalString
        else
          Cells[2,i+1] := '';
        LastRow:=i+1;
        sgENTravelSheetItemDistance2TKFuelKoef.RowCount:=LastRow+1;
      end;
   sgENTravelSheetItemDistance2TKFuelKoef.Row:=1;
end;

procedure TfrmENTravelSheetItemDistanceEdit.actInsertExecute(
  Sender: TObject);
var
  TempENTravelSheetItemDistance2TKFuelKoef : ENTravelSheetItemDistance2TKFuelKoefControllerSoapPort;
  TempENTravelSheetItemDistance : ENTravelSheetItemDistanceControllerSoapPort;
  ENTravelSheetItemDistance2TKFuelKoefObj : ENTravelSheetItemDistance2TKFuelKoef;
  TKFuelKoefFilterObj : TKFuelKoefFilter;
  objCode : Integer;
  frmTKFuelKoefShow :  TfrmTKFuelKoefShow;
begin
  inherited;

  if ENTravelSheetItemDistanceObj.code = Low(Integer) then Exit;

  ENTravelSheetItemDistance2TKFuelKoefObj := ENTravelSheetItemDistance2TKFuelKoef.Create;
  ENTravelSheetItemDistance2TKFuelKoefObj.travelSheetItemDistanceRef := ENTravelSheetItemDistanceRef.Create;
  ENTravelSheetItemDistance2TKFuelKoefObj.travelSheetItemDistanceRef.code := ENTravelSheetItemDistanceObj.code;

  TKFuelKoefFilterObj := TKFuelKoefFilter.Create;
  SetNullXSProps(TKFuelKoefFilterObj);
  SetNullIntProps(TKFuelKoefFilterObj);
  TKFuelKoefFilterObj.tkFuelKoefTypeRef := TKFuelKoefTypeRef.Create;
  TKFuelKoefFilterObj.tkFuelKoefTypeRef.code :=  TKFUELKOEFTYPE_TRAVELSHEETITEM;

  frmTKFuelKoefShow := TfrmTKFuelKoefShow.Create(Application, fmNormal, TKFuelKoefFilterObj);
  try
      with frmTKFuelKoefShow do
      begin
        DisableActions([ actNoFilter, actDelete, actFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               objCode := StrToInt(GetReturnValue(sgTKFuelKoef,0));;
            except
               on EConvertError do Exit;
            end;

            ENTravelSheetItemDistance2TKFuelKoefObj.tkFuelKoefRef := TKFuelKoefRef.Create;
            ENTravelSheetItemDistance2TKFuelKoefObj.tkFuelKoefRef.code := objCode;

            TempENTravelSheetItemDistance2TKFuelKoef := HTTPRIOENTravelSheetItemDistance2TKFuelKoef as ENTravelSheetItemDistance2TKFuelKoefControllerSoapPort;
            TempENTravelSheetItemDistance2TKFuelKoef.add(ENTravelSheetItemDistance2TKFuelKoefObj);
            TempENTravelSheetItemDistance := HTTPRIOENTravelSheetItemDistance as ENTravelSheetItemDistanceControllerSoapPort;
            edtKoef.Text := TempENTravelSheetItemDistance.getAggregateSumOfKoefs(ENTravelSheetItemDistanceObj.code).DecimalString;
        end;
      end;
        updateKoefGrid();
   finally
      frmTKFuelKoefShow.Free;
   end;
end;

procedure TfrmENTravelSheetItemDistanceEdit.actDeleteExecute(
  Sender: TObject);
var
  TempENTravelSheetItemDistance2TKFuelKoef : ENTravelSheetItemDistance2TKFuelKoefControllerSoapPort;
  TempENTravelSheetItemDistance : ENTravelSheetItemDistanceControllerSoapPort;
  objCode : Integer;
begin
  inherited;
  try
    ObjCode := StrToInt(sgENTravelSheetItemDistance2TKFuelKoef.Cells[0,sgENTravelSheetItemDistance2TKFuelKoef.Row]);
  except
  on EConvertError do Exit;
  end;
  TempENTravelSheetItemDistance2TKFuelKoef := HTTPRIOENTravelSheetItemDistance2TKFuelKoef as ENTravelSheetItemDistance2TKFuelKoefControllerSoapPort;
  TempENTravelSheetItemDistance2TKFuelKoef.remove(objCode);
  TempENTravelSheetItemDistance := HTTPRIOENTravelSheetItemDistance as ENTravelSheetItemDistanceControllerSoapPort;
  edtKoef.Text := TempENTravelSheetItemDistance.getAggregateSumOfKoefs(ENTravelSheetItemDistanceObj.code).DecimalString;
  updateKoefGrid();
end;

procedure TfrmENTravelSheetItemDistanceEdit.actUpdateExecute(
  Sender: TObject);
begin
  inherited;
  updateKoefGrid();
end;

end.
