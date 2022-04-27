
unit ShowScanCounters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs,
  ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ScanCountersController,AdvObj ;

type
  TfrmScanCountersShow = class(TChildForm)
    ImageList1: TImageList;
    sgScanCounters: TAdvStringGrid;
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
    HTTPRIOScanCounters: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgScanCountersTopLeftChanged(Sender: TObject);
procedure sgScanCountersDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
procedure actSelectExecute(Sender: TObject); override;

  private
   { Private declarations }
 public
   { Public declarations }
   account: String;
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ScanCountersShort; stdcall; static;
 end;

var
 frmScanCountersShow : TfrmScanCountersShow;
 // ScanCountersObj: ScanCounters;
 // ScanCountersFilterObj: ScanCountersFilter;
budgetCode:Integer;
molCode:String;

implementation

uses Main,EditScanCountersFilter;//, EditScanCounters, EditScanCountersFilter, EditCounterFilter;


{$R *.dfm}

var
 // frmScanCountersShow : TfrmScanCountersShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ScanCountersHeaders: array [1..6] of String =
        ( 'Код'
          ,'Наименование'
          ,'инвентарный №'
          ,'серийный №'
          ,'код РЭСа'
          ,'Дата выпуска'
        );
   

class function TfrmScanCountersShow.chooseFromList : ScanCountersShort;
var
  selectedCounter : ScanCountersShort;
begin
  inherited;
     frmScanCountersShow:= TfrmScanCountersShow.Create(Application,fmNormal);
       selectedCounter := nil;
       try
          with frmScanCountersShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selectedCounter := ScanCountersShort(sgSCanCounters.Objects[0, sgSCanCounters.Row]);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
          Result := selectedCounter;
       finally
          frmScanCountersShow.Free;
       end;

end;

procedure TfrmScanCountersShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmScanCountersShow:=nil;
    inherited;
  end;


procedure TfrmScanCountersShow.FormShow(Sender: TObject);
var
  TempScanCounters: ScanCountersControllerSoapPort;
  i: Integer;
  ScanCountersList: ScanCountersShortList;
  begin
  SetGridHeaders(ScanCountersHeaders, sgScanCounters.ColumnHeaders);
  ColCount:=100;
  TempScanCounters :=  HTTPRIOScanCounters as ScanCountersControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ScanCountersFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end
  else
  begin
  ScanCountersList := TempScanCounters.getScrollableFilteredListNet(ScanCountersFilter(FilterObject),0,ColCount);

  if ScanCountersList = nil then Exit;

  LastCount:=High(ScanCountersList.list);

  if LastCount > -1 then
     sgScanCounters.RowCount:=LastCount+2
  else
     sgScanCounters.RowCount:=2;

   with sgScanCounters do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        Cells[0,i+1] := IntToStr(ScanCountersList.list[i].num_un);
        Cells[1,i+1] := ScanCountersList.list[i].name;
        Cells[2,i+1] := ScanCountersList.list[i].invnumber;
        Cells[3,i+1] := ScanCountersList.list[i].serialnumber;
        Cells[4,i+1] := InttoStr(ScanCountersList.list[i].codePodr);
        if ScanCountersList.list[i].dt_vypusk<>nil then
        Cells[5,i+1] := XSDate2String(ScanCountersList.list[i].dt_vypusk)
        else Cells[5,i+1]:='';

        Cells[6,i+1] := ScanCountersList.list[i].str_name;
        Cells[7,i+1] := ScanCountersList.list[i].sum_st_nds.DecimalString;
        Cells[8,i+1] := ScanCountersList.list[i].kod_subsch_b;
        Cells[9,i+1] := ScanCountersList.list[i].mol;

        Objects[0, i+1] := ScanCountersList.list[i];
        LastRow:=i+1;
        sgScanCounters.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgScanCounters.Row:=1;
  end;
end;

procedure TfrmScanCountersShow.sgScanCountersTopLeftChanged(Sender: TObject);
var
  TempScanCounters: ScanCountersControllerSoapPort;
  i,CurrentRow: Integer;
  ScanCountersList: ScanCountersShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgScanCounters.TopRow + sgScanCounters.VisibleRowCount) = ColCount
  then
    begin
      TempScanCounters :=  HTTPRIOScanCounters as ScanCountersControllerSoapPort;
      CurrentRow:=sgScanCounters.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ScanCountersFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ScanCountersList := TempScanCounters.getScrollableFilteredListNet(ScanCountersFilter(FilterObject),ColCount-1, 100);



  sgScanCounters.RowCount:=sgScanCounters.RowCount+100;
  LastCount:=High(ScanCountersList.list);
  with sgScanCounters do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        
        Cells[0,i+CurrentRow] := IntToStr(ScanCountersList.list[i].num_un);
        Cells[1,i+CurrentRow] := ScanCountersList.list[i].name;
        Cells[2,i+CurrentRow] := ScanCountersList.list[i].invnumber;
        Cells[3,i+CurrentRow] := ScanCountersList.list[i].serialnumber;
        Cells[4,i+CurrentRow] := InttoStr(ScanCountersList.list[i].codePodr);
        if ScanCountersList.list[i].dt_vypusk<>nil then
        Cells[5,i+CurrentRow] := XSDate2String(ScanCountersList.list[i].dt_vypusk)
        else Cells[5,i+CurrentRow]:='';


        Cells[6,i+CurrentRow] := ScanCountersList.list[i].str_name;
        Cells[7,i+CurrentRow] := ScanCountersList.list[i].sum_st_nds.DecimalString;
        Cells[8,i+CurrentRow] := ScanCountersList.list[i].kod_subsch_b;
        Cells[9,i+CurrentRow] := ScanCountersList.list[i].mol;

        Objects[0, i+CurrentRow] := ScanCountersList.list[i];
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgScanCounters.Row:=CurrentRow-5;
   sgScanCounters.RowCount:=LastRow+1;
  end;
end;

procedure TfrmScanCountersShow.sgScanCountersDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgScanCounters,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmScanCountersShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgScanCounters.RowCount-1 do
   for j:=0 to sgScanCounters.ColCount-1 do
     sgScanCounters.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmScanCountersShow.actViewExecute(Sender: TObject);
Var TempScanCounters: ScanCountersControllerSoapPort;
begin
{ TempScanCounters := HTTPRIOScanCounters as ScanCountersControllerSoapPort;
   try
     ScanCountersObj := TempScanCounters.getObject(StrToInt(sgScanCounters.Cells[0,sgScanCounters.Row]));
   except
   on EConvertError do Exit;
  end;
  frmScanCountersEdit:=TfrmScanCountersEdit.Create(Application, dsView);
  try
    frmScanCountersEdit.ShowModal;
  finally
    frmScanCountersEdit.Free;
    frmScanCountersEdit:=nil;
  end;  }
end;

procedure TfrmScanCountersShow.actEditExecute(Sender: TObject);
Var TempScanCounters: ScanCountersControllerSoapPort;
begin
 {TempScanCounters := HTTPRIOScanCounters as ScanCountersControllerSoapPort;
   try
     ScanCountersObj := TempScanCounters.getObject(StrToInt(sgScanCounters.Cells[0,sgScanCounters.Row]));
   except
   on EConvertError do Exit;
  end;
  frmScanCountersEdit:=TfrmScanCountersEdit.Create(Application, dsEdit);
  try
    if frmScanCountersEdit.ShowModal= mrOk then
      begin
        //TempScanCounters.save(ScanCountersObj);
        UpdateGrid(Sender);
      end;
  finally
    frmScanCountersEdit.Free;
    frmScanCountersEdit:=nil;
  end;    }
end;

procedure TfrmScanCountersShow.actDeleteExecute(Sender: TObject);
Var TempScanCounters: ScanCountersControllerSoapPort;
  ObjCode: Integer;
begin
 TempScanCounters := HTTPRIOScanCounters as ScanCountersControllerSoapPort;
   try
     ObjCode := StrToInt(sgScanCounters.Cells[0,sgScanCounters.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Счетчик) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempScanCounters.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmScanCountersShow.actInsertExecute(Sender: TObject);
Var TempScanCounters: ScanCountersControllerSoapPort;
begin
 { TempScanCounters := HTTPRIOScanCounters as ScanCountersControllerSoapPort;
  ScanCountersObj:=ScanCounters.Create;



  try
    frmScanCountersEdit:=TfrmScanCountersEdit.Create(Application, dsInsert);
    try
      if frmScanCountersEdit.ShowModal = mrOk then
      begin
        if ScanCountersObj<>nil then
            //TempScanCounters.add(ScanCountersObj);
            UpdateGrid(Sender);
      end;
    finally
      frmScanCountersEdit.Free;
      frmScanCountersEdit:=nil;
    end;
  finally
    ScanCountersObj.Free;
  end;  }
end;

procedure TfrmScanCountersShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmScanCountersShow.actFilterExecute(Sender: TObject);
begin
  frmScanCountersFilterEdit:=TfrmScanCountersFilterEdit.Create(Application, dsInsert);
  try

    if frmScanCountersFilterEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;
  finally
    frmScanCountersFilterEdit.Free;
    frmScanCountersFilterEdit:=nil;
  end;
end;

procedure TfrmScanCountersShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;


procedure TfrmScanCountersShow.actSelectExecute(Sender: TObject);
Var temp: String;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=GetReturnValue(sgScanCounters,2);
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

end.
