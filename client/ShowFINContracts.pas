
unit ShowFINContracts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  FINContractsController, AdvObj ;


type
  TfrmFINContractsShow = class(TChildForm)  
  HTTPRIOFINContracts: THTTPRIO;
    ImageList1: TImageList;
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
    sgFINContracts: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgFINContractsTopLeftChanged(Sender: TObject);
procedure sgFINContractsDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmFINContractsShow : TfrmFINContractsShow;
 // FINContractsObj: FINContracts;
 // FINContractsFilterObj: FINContractsFilter;
  
  
implementation

uses Main, EditFINContracts, EditFINContractsFilter;


{$R *.dfm}

var
  //frmFINContractsShow : TfrmFINContractsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  FINContractsHeaders: array [1..6] of String =
        ( 'Код'
          ,'Постачальник'
          ,'Номер договору'
          ,'Дата договору'
          ,'Код договору у ФК'
          ,'ID договору у ФК'
        );
   

procedure TfrmFINContractsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINContractsShow:=nil;
    inherited;
  end;


procedure TfrmFINContractsShow.FormShow(Sender: TObject);
var
  TempFINContracts: FINContractsControllerSoapPort;
  i: Integer;
  FINContractsList: FINContractsShortList;
  begin
  SetGridHeaders(FINContractsHeaders, sgFINContracts.ColumnHeaders);
  ColCount:=100;
  TempFINContracts :=  HTTPRIOFINContracts as FINContractsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := FINContractsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);

     FINContractsFilter(FilterObject).orderBySQL := 'ORGNAME, CONTRACTNUMBER';
  end;

  FINContractsList := TempFINContracts.getScrollableFilteredList(FINContractsFilter(FilterObject),0,ColCount);


  LastCount:=High(FINContractsList.list);

  if LastCount > -1 then
     sgFINContracts.RowCount:=LastCount+2
  else
     sgFINContracts.RowCount:=2;

   with sgFINContracts do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINContractsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINContractsList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := FINContractsList.list[i].orgName;

        Cells[2,i+1] := FINContractsList.list[i].contractNumber;
        if FINContractsList.list[i].contractDate = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(FINContractsList.list[i].contractDate);

        Cells[4,i+1] := FINContractsList.list[i].finDocCode;
        if FINContractsList.list[i].finDocID = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(FINContractsList.list[i].finDocID);
        LastRow:=i+1;
        sgFINContracts.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINContracts.Row:=1;
end;

procedure TfrmFINContractsShow.sgFINContractsTopLeftChanged(Sender: TObject);
var
  TempFINContracts: FINContractsControllerSoapPort;
  i,CurrentRow: Integer;
  FINContractsList: FINContractsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINContracts.TopRow + sgFINContracts.VisibleRowCount) = ColCount
  then
    begin
      TempFINContracts :=  HTTPRIOFINContracts as FINContractsControllerSoapPort;
      CurrentRow:=sgFINContracts.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := FINContractsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);

     FINContractsFilter(FilterObject).orderBySQL := 'ORGNAME, CONTRACTNUMBER';
  end;

  FINContractsList := TempFINContracts.getScrollableFilteredList(FINContractsFilter(FilterObject),ColCount-1, 100);



  sgFINContracts.RowCount:=sgFINContracts.RowCount+100;
  LastCount:=High(FINContractsList.list);
  with sgFINContracts do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if FINContractsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINContractsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := FINContractsList.list[i].orgName;

        Cells[2,i+CurrentRow] := FINContractsList.list[i].contractNumber;
        if FINContractsList.list[i].contractDate = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(FINContractsList.list[i].contractDate);

        Cells[4,i+CurrentRow] := FINContractsList.list[i].finDocCode;
        if FINContractsList.list[i].finDocID = Low(Integer) then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := IntToStr(FINContractsList.list[i].finDocID);
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINContracts.Row:=CurrentRow-5;
   sgFINContracts.RowCount:=LastRow+1;
  end;
end;

procedure TfrmFINContractsShow.sgFINContractsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgFINContracts,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINContractsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINContracts.RowCount-1 do
   for j:=0 to sgFINContracts.ColCount-1 do
     sgFINContracts.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINContractsShow.actViewExecute(Sender: TObject);
Var TempFINContracts: FINContractsControllerSoapPort;
begin
 TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
   try
     FINContractsObj := TempFINContracts.getObject(StrToInt(sgFINContracts.Cells[0,sgFINContracts.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINContractsEdit:=TfrmFINContractsEdit.Create(Application, dsView);
  try
    frmFINContractsEdit.ShowModal;
  finally
    frmFINContractsEdit.Free;
    frmFINContractsEdit:=nil;
  end;
end;

procedure TfrmFINContractsShow.actEditExecute(Sender: TObject);
Var TempFINContracts: FINContractsControllerSoapPort;
begin
 TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
   try
     FINContractsObj := TempFINContracts.getObject(StrToInt(sgFINContracts.Cells[0,sgFINContracts.Row]));
   except
   on EConvertError do Exit;
  end;
  frmFINContractsEdit:=TfrmFINContractsEdit.Create(Application, dsEdit);
  try
    if frmFINContractsEdit.ShowModal= mrOk then
      begin
        //TempFINContracts.save(FINContractsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmFINContractsEdit.Free;
    frmFINContractsEdit:=nil;
  end;
end;

procedure TfrmFINContractsShow.actDeleteExecute(Sender: TObject);
Var TempFINContracts: FINContractsControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINContracts.Cells[0,sgFINContracts.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Договори з ФК) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempFINContracts.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINContractsShow.actInsertExecute(Sender: TObject);
// Var TempFINContracts: FINContractsControllerSoapPort; 
begin
  // TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;  /// Это здесь уже лишнее!!!
  FINContractsObj:=FINContracts.Create;

   //FINContractsObj.contractDate:= TXSDate.Create;


  try
    frmFINContractsEdit:=TfrmFINContractsEdit.Create(Application, dsInsert);
    try
      if frmFINContractsEdit.ShowModal = mrOk then
      begin
        if FINContractsObj<>nil then
            //TempFINContracts.add(FINContractsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmFINContractsEdit.Free;
      frmFINContractsEdit:=nil;
    end;
  finally
    FINContractsObj.Free;
  end;
end;

procedure TfrmFINContractsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmFINContractsShow.actFilterExecute(Sender: TObject);
begin
  frmFINContractsFilterEdit := TfrmFINContractsFilterEdit.Create(Application, dsInsert);
  try
    FINContractsFilterObj := FINContractsFilter.Create;
    SetNullIntProps(FINContractsFilterObj);
    SetNullXSProps(FINContractsFilterObj);

    if frmFINContractsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINContractsFilter.Create;
      FilterObject := FINContractsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmFINContractsFilterEdit.Free;
    frmFINContractsFilterEdit := nil;
  end;
end;

procedure TfrmFINContractsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.