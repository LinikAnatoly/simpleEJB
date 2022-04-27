
unit ShowRQPurchaseItemTender2EnContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  RQPurchaseItemTender2EnContractController ;


type
    TfrmRQPurchaseItemTender2EnContractShow = class(TChildForm)  
    HTTPRIORQPurchaseItemTender2EnContract: THTTPRIO;
    ImageList1: TImageList;
    sgRQPurchaseItemTender2EnContract: TAdvStringGrid;
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
    procedure sgRQPurchaseItemTender2EnContractTopLeftChanged(Sender: TObject);
    procedure sgRQPurchaseItemTender2EnContractDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // RQPurchaseItemTender2EnContractObj: RQPurchaseItemTender2EnContract;
 // RQPurchaseItemTender2EnContractFilterObj: RQPurchaseItemTender2EnContractFilter;
  
  
implementation

uses Main, EditRQPurchaseItemTender2EnContract, EditRQPurchaseItemTender2EnContractFilter;


{$R *.dfm}

var
  //frmRQPurchaseItemTender2EnContractShow : TfrmRQPurchaseItemTender2EnContractShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQPurchaseItemTender2EnContractHeaders: array [1..2] of String =
        ( 'Код'
          ,'пользователь внесший изменение'
        );
   

procedure TfrmRQPurchaseItemTender2EnContractShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmRQPurchaseItemTender2EnContractShow:=nil;
  inherited;
end;


procedure TfrmRQPurchaseItemTender2EnContractShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmRQPurchaseItemTender2EnContractShow.FormShow(Sender: TObject);
var
  TempRQPurchaseItemTender2EnContract: RQPurchaseItemTender2EnContractControllerSoapPort;
  i: Integer;
  RQPurchaseItemTender2EnContractList: RQPurchaseItemTender2EnContractShortList;
begin
  SetGridHeaders(RQPurchaseItemTender2EnContractHeaders, sgRQPurchaseItemTender2EnContract.ColumnHeaders);
  ColCount:=100;
  TempRQPurchaseItemTender2EnContract :=  HTTPRIORQPurchaseItemTender2EnContract as RQPurchaseItemTender2EnContractControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItemTender2EnContractFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItemTender2EnContractList := TempRQPurchaseItemTender2EnContract.getScrollableFilteredList(RQPurchaseItemTender2EnContractFilter(FilterObject),0,ColCount);
  LastCount:=High(RQPurchaseItemTender2EnContractList.list);

  if LastCount > -1 then
     sgRQPurchaseItemTender2EnContract.RowCount:=LastCount+2
  else
     sgRQPurchaseItemTender2EnContract.RowCount:=2;

   with sgRQPurchaseItemTender2EnContract do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemTender2EnContractList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPurchaseItemTender2EnContractList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPurchaseItemTender2EnContractList.list[i].userGen;
        LastRow:=i+1;
        sgRQPurchaseItemTender2EnContract.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgRQPurchaseItemTender2EnContract.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgRQPurchaseItemTender2EnContract.RowCount > selectedRow then
      sgRQPurchaseItemTender2EnContract.Row := selectedRow
    else
      sgRQPurchaseItemTender2EnContract.Row := sgRQPurchaseItemTender2EnContract.RowCount - 1;
    end
    else
      sgRQPurchaseItemTender2EnContract.Row:=1;   
end;


procedure TfrmRQPurchaseItemTender2EnContractShow.sgRQPurchaseItemTender2EnContractTopLeftChanged(Sender: TObject);
var
  TempRQPurchaseItemTender2EnContract: RQPurchaseItemTender2EnContractControllerSoapPort;
  i,CurrentRow: Integer;
  RQPurchaseItemTender2EnContractList: RQPurchaseItemTender2EnContractShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPurchaseItemTender2EnContract.TopRow + sgRQPurchaseItemTender2EnContract.VisibleRowCount) = ColCount
  then
    begin
      TempRQPurchaseItemTender2EnContract :=  HTTPRIORQPurchaseItemTender2EnContract as RQPurchaseItemTender2EnContractControllerSoapPort;
      CurrentRow:=sgRQPurchaseItemTender2EnContract.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPurchaseItemTender2EnContractFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQPurchaseItemTender2EnContractList := TempRQPurchaseItemTender2EnContract.getScrollableFilteredList(RQPurchaseItemTender2EnContractFilter(FilterObject),ColCount-1, 100);


  sgRQPurchaseItemTender2EnContract.RowCount:=sgRQPurchaseItemTender2EnContract.RowCount+100;
  LastCount:=High(RQPurchaseItemTender2EnContractList.list);
  with sgRQPurchaseItemTender2EnContract do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPurchaseItemTender2EnContractList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPurchaseItemTender2EnContractList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPurchaseItemTender2EnContractList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPurchaseItemTender2EnContract.Row:=CurrentRow-5;
   sgRQPurchaseItemTender2EnContract.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPurchaseItemTender2EnContractShow.sgRQPurchaseItemTender2EnContractDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPurchaseItemTender2EnContract,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmRQPurchaseItemTender2EnContractShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgRQPurchaseItemTender2EnContract.RowCount-1 do
   for j:=0 to sgRQPurchaseItemTender2EnContract.ColCount-1 do
     sgRQPurchaseItemTender2EnContract.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmRQPurchaseItemTender2EnContractShow.actViewExecute(Sender: TObject);
var 
  TempRQPurchaseItemTender2EnContract: RQPurchaseItemTender2EnContractControllerSoapPort;
begin
  TempRQPurchaseItemTender2EnContract := HTTPRIORQPurchaseItemTender2EnContract as RQPurchaseItemTender2EnContractControllerSoapPort;
  try
    RQPurchaseItemTender2EnContractObj := TempRQPurchaseItemTender2EnContract.getObject(StrToInt(sgRQPurchaseItemTender2EnContract.Cells[0,sgRQPurchaseItemTender2EnContract.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRQPurchaseItemTender2EnContract.Row;
  frmRQPurchaseItemTender2EnContractEdit:=TfrmRQPurchaseItemTender2EnContractEdit.Create(Application, dsView);
  
  try
    frmRQPurchaseItemTender2EnContractEdit.ShowModal;
  finally
    frmRQPurchaseItemTender2EnContractEdit.Free;
    frmRQPurchaseItemTender2EnContractEdit:=nil;
  end;

  if sgRQPurchaseItemTender2EnContract.RowCount > selectedRow then
    sgRQPurchaseItemTender2EnContract.Row := selectedRow
  else
    sgRQPurchaseItemTender2EnContract.Row := sgRQPurchaseItemTender2EnContract.RowCount - 1;
  
end;


procedure TfrmRQPurchaseItemTender2EnContractShow.actEditExecute(Sender: TObject);
var 
  TempRQPurchaseItemTender2EnContract: RQPurchaseItemTender2EnContractControllerSoapPort;
begin
  TempRQPurchaseItemTender2EnContract := HTTPRIORQPurchaseItemTender2EnContract as RQPurchaseItemTender2EnContractControllerSoapPort;
  try
    RQPurchaseItemTender2EnContractObj := TempRQPurchaseItemTender2EnContract.getObject(StrToInt(sgRQPurchaseItemTender2EnContract.Cells[0,sgRQPurchaseItemTender2EnContract.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRQPurchaseItemTender2EnContract.Row;
  frmRQPurchaseItemTender2EnContractEdit:=TfrmRQPurchaseItemTender2EnContractEdit.Create(Application, dsEdit);
  
  try
    if frmRQPurchaseItemTender2EnContractEdit.ShowModal= mrOk then
      begin
        //TempRQPurchaseItemTender2EnContract.save(RQPurchaseItemTender2EnContractObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQPurchaseItemTender2EnContractEdit.Free;
    frmRQPurchaseItemTender2EnContractEdit:=nil;
  end;

  if sgRQPurchaseItemTender2EnContract.RowCount > selectedRow then
    sgRQPurchaseItemTender2EnContract.Row := selectedRow
  else
    sgRQPurchaseItemTender2EnContract.Row := sgRQPurchaseItemTender2EnContract.RowCount - 1;
  
end;


procedure TfrmRQPurchaseItemTender2EnContractShow.actDeleteExecute(Sender: TObject);
Var TempRQPurchaseItemTender2EnContract: RQPurchaseItemTender2EnContractControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPurchaseItemTender2EnContract := HTTPRIORQPurchaseItemTender2EnContract as RQPurchaseItemTender2EnContractControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPurchaseItemTender2EnContract.Cells[0,sgRQPurchaseItemTender2EnContract.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Звязок позицій тендерних строк з договорами  ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPurchaseItemTender2EnContract.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPurchaseItemTender2EnContractShow.actInsertExecute(Sender: TObject);
// Var TempRQPurchaseItemTender2EnContract: RQPurchaseItemTender2EnContractControllerSoapPort; 
begin
  // TempRQPurchaseItemTender2EnContract := HTTPRIORQPurchaseItemTender2EnContract as RQPurchaseItemTender2EnContractControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQPurchaseItemTender2EnContractObj:=RQPurchaseItemTender2EnContract.Create;
  SetNullIntProps(RQPurchaseItemTender2EnContractObj);
  SetNullXSProps(RQPurchaseItemTender2EnContractObj);



  try
    frmRQPurchaseItemTender2EnContractEdit:=TfrmRQPurchaseItemTender2EnContractEdit.Create(Application, dsInsert);
    try
      if frmRQPurchaseItemTender2EnContractEdit.ShowModal = mrOk then
      begin
        if RQPurchaseItemTender2EnContractObj<>nil then
            //TempRQPurchaseItemTender2EnContract.add(RQPurchaseItemTender2EnContractObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQPurchaseItemTender2EnContractEdit.Free;
      frmRQPurchaseItemTender2EnContractEdit:=nil;
    end;
  finally
    RQPurchaseItemTender2EnContractObj.Free;
  end;
end;


procedure TfrmRQPurchaseItemTender2EnContractShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmRQPurchaseItemTender2EnContractShow.actFilterExecute(Sender: TObject);
begin
{frmRQPurchaseItemTender2EnContractFilterEdit:=TfrmRQPurchaseItemTender2EnContractFilterEdit.Create(Application, dsInsert);
  try
    RQPurchaseItemTender2EnContractFilterObj := RQPurchaseItemTender2EnContractFilter.Create;
    SetNullIntProps(RQPurchaseItemTender2EnContractFilterObj);
    SetNullXSProps(RQPurchaseItemTender2EnContractFilterObj);

    if frmRQPurchaseItemTender2EnContractFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := RQPurchaseItemTender2EnContractFilter.Create;
      FilterObject := RQPurchaseItemTender2EnContractFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPurchaseItemTender2EnContractFilterEdit.Free;
    frmRQPurchaseItemTender2EnContractFilterEdit:=nil;
  end;}
end;


procedure TfrmRQPurchaseItemTender2EnContractShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.