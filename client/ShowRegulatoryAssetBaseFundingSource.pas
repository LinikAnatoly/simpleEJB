
unit ShowRegulatoryAssetBaseFundingSource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  RegulatoryAssetBaseCalculationController, AdvObj ;


type
    TfrmRegulatoryAssetBaseFundingSourceShow = class(TChildForm)
    HTTPRIORegulatoryAssetBaseCalculation: THTTPRIO;
    ImageList1: TImageList;
    sgRegulatoryAssetBaseFundingSource: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgRegulatoryAssetBaseFundingSourceTopLeftChanged(Sender: TObject);
    procedure sgRegulatoryAssetBaseFundingSourceDblClick(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : RegulatoryAssetBaseFundingSourceShort; stdcall; static;
 end;


var
  frmRegulatoryAssetBaseFundingSourceShow: TfrmRegulatoryAssetBaseFundingSourceShow;
  
  
implementation

uses Main;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RegulatoryAssetBaseFundingSourceHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   
class function TfrmRegulatoryAssetBaseFundingSourceShow.chooseFromList : RegulatoryAssetBaseFundingSourceShort;
var
  f1 : RegulatoryAssetBaseFundingSourceFilter;
  frmRegulatoryAssetBaseFundingSourceShow : TfrmRegulatoryAssetBaseFundingSourceShow;
  selected : RegulatoryAssetBaseFundingSourceShort;
begin
  inherited;
     selected := nil;
     f1 := RegulatoryAssetBaseFundingSourceFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmRegulatoryAssetBaseFundingSourceShow := TfrmRegulatoryAssetBaseFundingSourceShow.Create(Application, fmNormal, f1);
       try
          with frmRegulatoryAssetBaseFundingSourceShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := RegulatoryAssetBaseFundingSourceShort(sgRegulatoryAssetBaseFundingSource.Objects[0, sgRegulatoryAssetBaseFundingSource.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmRegulatoryAssetBaseFundingSourceShow.Free;
       end;
end;

procedure TfrmRegulatoryAssetBaseFundingSourceShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmRegulatoryAssetBaseFundingSourceShow:=nil;
  inherited;
end;


procedure TfrmRegulatoryAssetBaseFundingSourceShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmRegulatoryAssetBaseFundingSourceShow.FormShow(Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  i: Integer;
  RegulatoryAssetBaseFundingSourceList: RegulatoryAssetBaseFundingSourceShortList;
begin
  SetGridHeaders(RegulatoryAssetBaseFundingSourceHeaders, sgRegulatoryAssetBaseFundingSource.ColumnHeaders);
  ColCount:=100;
  TempRegulatoryAssetBaseCalculation :=  HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RegulatoryAssetBaseFundingSourceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RegulatoryAssetBaseFundingSourceList := TempRegulatoryAssetBaseCalculation.getScrollableFilteredListOfFundingSources(RegulatoryAssetBaseFundingSourceFilter(FilterObject),0,ColCount);
  LastCount:=High(RegulatoryAssetBaseFundingSourceList.list);

  if LastCount > -1 then
     sgRegulatoryAssetBaseFundingSource.RowCount:=LastCount+2
  else
     sgRegulatoryAssetBaseFundingSource.RowCount:=2;

   with sgRegulatoryAssetBaseFundingSource do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RegulatoryAssetBaseFundingSourceList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RegulatoryAssetBaseFundingSourceList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RegulatoryAssetBaseFundingSourceList.list[i].name;
		Objects[0, i+1] := RegulatoryAssetBaseFundingSourceList.list[i];
        LastRow:=i+1;
        sgRegulatoryAssetBaseFundingSource.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgRegulatoryAssetBaseFundingSource.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgRegulatoryAssetBaseFundingSource.RowCount > selectedRow then
      sgRegulatoryAssetBaseFundingSource.Row := selectedRow
    else
      sgRegulatoryAssetBaseFundingSource.Row := sgRegulatoryAssetBaseFundingSource.RowCount - 1;
    end
    else
      sgRegulatoryAssetBaseFundingSource.Row:=1;   
end;


procedure TfrmRegulatoryAssetBaseFundingSourceShow.sgRegulatoryAssetBaseFundingSourceTopLeftChanged(Sender: TObject);
var
  TempRegulatoryAssetBaseCalculation : RegulatoryAssetBaseCalculationControllerSoapPort;
  i,CurrentRow: Integer;
  RegulatoryAssetBaseFundingSourceList: RegulatoryAssetBaseFundingSourceShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRegulatoryAssetBaseFundingSource.TopRow + sgRegulatoryAssetBaseFundingSource.VisibleRowCount) = ColCount
  then
    begin
      TempRegulatoryAssetBaseCalculation :=  HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;
      CurrentRow:=sgRegulatoryAssetBaseFundingSource.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RegulatoryAssetBaseFundingSourceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RegulatoryAssetBaseFundingSourceList := TempRegulatoryAssetBaseCalculation.getScrollableFilteredListOfFundingSources(RegulatoryAssetBaseFundingSourceFilter(FilterObject),ColCount-1, 100);


  sgRegulatoryAssetBaseFundingSource.RowCount:=sgRegulatoryAssetBaseFundingSource.RowCount+100;
  LastCount:=High(RegulatoryAssetBaseFundingSourceList.list);
  with sgRegulatoryAssetBaseFundingSource do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RegulatoryAssetBaseFundingSourceList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RegulatoryAssetBaseFundingSourceList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RegulatoryAssetBaseFundingSourceList.list[i].name;
		  Objects[0, i+CurrentRow] := RegulatoryAssetBaseFundingSourceList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRegulatoryAssetBaseFundingSource.Row:=CurrentRow-5;
   sgRegulatoryAssetBaseFundingSource.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRegulatoryAssetBaseFundingSourceShow.sgRegulatoryAssetBaseFundingSourceDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRegulatoryAssetBaseFundingSource,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmRegulatoryAssetBaseFundingSourceShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgRegulatoryAssetBaseFundingSource.RowCount-1 do
   for j:=0 to sgRegulatoryAssetBaseFundingSource.ColCount-1 do
     sgRegulatoryAssetBaseFundingSource.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmRegulatoryAssetBaseFundingSourceShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmRegulatoryAssetBaseFundingSourceShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.