
unit ShowTKMaterials2RQContracts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  TKMaterials2RQContractsController, AdvObj ;


type
  TfrmTKMaterials2RQContractsShow = class(TChildForm)  
  HTTPRIOTKMaterials2RQContracts: THTTPRIO;
    ImageList1: TImageList;
    sgTKMaterials2RQContracts: TAdvStringGrid;
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
procedure sgTKMaterials2RQContractsTopLeftChanged(Sender: TObject);
procedure sgTKMaterials2RQContractsDblClick(Sender: TObject);
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

//var
 // TKMaterials2RQContractsObj: TKMaterials2RQContracts;
 // TKMaterials2RQContractsFilterObj: TKMaterials2RQContractsFilter;
  
  
implementation

uses Main, EditTKMaterials2RQContracts, EditTKMaterials2RQContractsFilter;


{$R *.dfm}

var
  //frmTKMaterials2RQContractsShow : TfrmTKMaterials2RQContractsShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  TKMaterials2RQContractsHeaders: array [1..6] of String =
        ( 'Код'
          ,'Назва матеріалу'
          ,'Код организації'
          ,'Найменування организації'
          ,'Номер договору'
          ,'Дата договору'
        );
   

procedure TfrmTKMaterials2RQContractsShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmTKMaterials2RQContractsShow:=nil;
    inherited;
  end;


procedure TfrmTKMaterials2RQContractsShow.FormShow(Sender: TObject);
var
  TempTKMaterials2RQContracts: TKMaterials2RQContractsControllerSoapPort;
  i: Integer;
  TKMaterials2RQContractsList: TKMaterials2RQContractsShortList;
  begin
  SetGridHeaders(TKMaterials2RQContractsHeaders, sgTKMaterials2RQContracts.ColumnHeaders);
  ColCount:=100;
  TempTKMaterials2RQContracts :=  HTTPRIOTKMaterials2RQContracts as TKMaterials2RQContractsControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := TKMaterials2RQContractsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  TKMaterials2RQContractsList := TempTKMaterials2RQContracts.getScrollableFilteredList(TKMaterials2RQContractsFilter(FilterObject),0,ColCount);


  LastCount:=High(TKMaterials2RQContractsList.list);

  if LastCount > -1 then
     sgTKMaterials2RQContracts.RowCount:=LastCount+2
  else
     sgTKMaterials2RQContracts.RowCount:=2;

   with sgTKMaterials2RQContracts do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if TKMaterials2RQContractsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(TKMaterials2RQContractsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := TKMaterials2RQContractsList.list[i].materialRefName;
        Cells[2,i+1] := TKMaterials2RQContractsList.list[i].codeorg;
        Cells[3,i+1] := TKMaterials2RQContractsList.list[i].name;
        Cells[4,i+1] := TKMaterials2RQContractsList.list[i].contractNumber;
        if TKMaterials2RQContractsList.list[i].contractDate = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(TKMaterials2RQContractsList.list[i].contractDate);
        LastRow:=i+1;
        sgTKMaterials2RQContracts.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgTKMaterials2RQContracts.Row:=1;
end;

procedure TfrmTKMaterials2RQContractsShow.sgTKMaterials2RQContractsTopLeftChanged(Sender: TObject);
var
  TempTKMaterials2RQContracts: TKMaterials2RQContractsControllerSoapPort;
  i,CurrentRow: Integer;
  TKMaterials2RQContractsList: TKMaterials2RQContractsShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgTKMaterials2RQContracts.TopRow + sgTKMaterials2RQContracts.VisibleRowCount) = ColCount
  then
    begin
      TempTKMaterials2RQContracts :=  HTTPRIOTKMaterials2RQContracts as TKMaterials2RQContractsControllerSoapPort;
      CurrentRow:=sgTKMaterials2RQContracts.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := TKMaterials2RQContractsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  TKMaterials2RQContractsList := TempTKMaterials2RQContracts.getScrollableFilteredList(TKMaterials2RQContractsFilter(FilterObject),ColCount-1, 100);



  sgTKMaterials2RQContracts.RowCount:=sgTKMaterials2RQContracts.RowCount+100;
  LastCount:=High(TKMaterials2RQContractsList.list);
  with sgTKMaterials2RQContracts do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if TKMaterials2RQContractsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(TKMaterials2RQContractsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

         Cells[1,i+CurrentRow] := TKMaterials2RQContractsList.list[i].materialRefName;
        Cells[2,i+CurrentRow] := TKMaterials2RQContractsList.list[i].codeorg;
        Cells[3,i+CurrentRow] := TKMaterials2RQContractsList.list[i].name;
        Cells[4,i+CurrentRow] := TKMaterials2RQContractsList.list[i].contractNumber;
        if TKMaterials2RQContractsList.list[i].contractDate = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDate2String(TKMaterials2RQContractsList.list[i].contractDate);
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgTKMaterials2RQContracts.Row:=CurrentRow-5;
   sgTKMaterials2RQContracts.RowCount:=LastRow+1;
  end;
end;

procedure TfrmTKMaterials2RQContractsShow.sgTKMaterials2RQContractsDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgTKMaterials2RQContracts,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmTKMaterials2RQContractsShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgTKMaterials2RQContracts.RowCount-1 do
   for j:=0 to sgTKMaterials2RQContracts.ColCount-1 do
     sgTKMaterials2RQContracts.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmTKMaterials2RQContractsShow.actViewExecute(Sender: TObject);
Var TempTKMaterials2RQContracts: TKMaterials2RQContractsControllerSoapPort;
begin
 TempTKMaterials2RQContracts := HTTPRIOTKMaterials2RQContracts as TKMaterials2RQContractsControllerSoapPort;
   try
     TKMaterials2RQContractsObj := TempTKMaterials2RQContracts.getObject(StrToInt(sgTKMaterials2RQContracts.Cells[0,sgTKMaterials2RQContracts.Row]));
   except
   on EConvertError do Exit;
  end;
  frmTKMaterials2RQContractsEdit:=TfrmTKMaterials2RQContractsEdit.Create(Application, dsView);
  try
    frmTKMaterials2RQContractsEdit.ShowModal;
  finally
    frmTKMaterials2RQContractsEdit.Free;
    frmTKMaterials2RQContractsEdit:=nil;
  end;
end;

procedure TfrmTKMaterials2RQContractsShow.actEditExecute(Sender: TObject);
Var TempTKMaterials2RQContracts: TKMaterials2RQContractsControllerSoapPort;
begin
 TempTKMaterials2RQContracts := HTTPRIOTKMaterials2RQContracts as TKMaterials2RQContractsControllerSoapPort;
   try
     TKMaterials2RQContractsObj := TempTKMaterials2RQContracts.getObject(StrToInt(sgTKMaterials2RQContracts.Cells[0,sgTKMaterials2RQContracts.Row]));
   except
   on EConvertError do Exit;
  end;
  frmTKMaterials2RQContractsEdit:=TfrmTKMaterials2RQContractsEdit.Create(Application, dsEdit);
  try
    if frmTKMaterials2RQContractsEdit.ShowModal= mrOk then
      begin
        //TempTKMaterials2RQContracts.save(TKMaterials2RQContractsObj);
        UpdateGrid(Sender);
      end;
  finally
    frmTKMaterials2RQContractsEdit.Free;
    frmTKMaterials2RQContractsEdit:=nil;
  end;
end;

procedure TfrmTKMaterials2RQContractsShow.actDeleteExecute(Sender: TObject);
Var TempTKMaterials2RQContracts: TKMaterials2RQContractsControllerSoapPort;
  ObjCode: Integer;
begin
 TempTKMaterials2RQContracts := HTTPRIOTKMaterials2RQContracts as TKMaterials2RQContractsControllerSoapPort;
   try
     ObjCode := StrToInt(sgTKMaterials2RQContracts.Cells[0,sgTKMaterials2RQContracts.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Договори для замовлення матеріалів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempTKMaterials2RQContracts.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmTKMaterials2RQContractsShow.actInsertExecute(Sender: TObject);
// Var TempTKMaterials2RQContracts: TKMaterials2RQContractsControllerSoapPort; 
begin
  // TempTKMaterials2RQContracts := HTTPRIOTKMaterials2RQContracts as TKMaterials2RQContractsControllerSoapPort;  /// Это здесь уже лишнее!!!
  TKMaterials2RQContractsObj := TKMaterials2RQContracts.Create;
  SetNullXSProps(TKMaterials2RQContractsObj);
  SetNullIntProps(TKMaterials2RQContractsObj);
   //TKMaterials2RQContractsObj.contractDate:= TXSDate.Create;


  try
    frmTKMaterials2RQContractsEdit:=TfrmTKMaterials2RQContractsEdit.Create(Application, dsInsert);
    try
      if frmTKMaterials2RQContractsEdit.ShowModal = mrOk then
      begin
        if TKMaterials2RQContractsObj<>nil then
            //TempTKMaterials2RQContracts.add(TKMaterials2RQContractsObj);
            UpdateGrid(Sender);
      end;
    finally
      frmTKMaterials2RQContractsEdit.Free;
      frmTKMaterials2RQContractsEdit:=nil;
    end;
  finally
    TKMaterials2RQContractsObj.Free;
  end;
end;

procedure TfrmTKMaterials2RQContractsShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmTKMaterials2RQContractsShow.actFilterExecute(Sender: TObject);
begin
frmTKMaterials2RQContractsFilterEdit:=TfrmTKMaterials2RQContractsFilterEdit.Create(Application, dsInsert);
  try
    TKMaterials2RQContractsFilterObj := TKMaterials2RQContractsFilter.Create;
    SetNullIntProps(TKMaterials2RQContractsFilterObj);
    SetNullXSProps(TKMaterials2RQContractsFilterObj);

    if frmTKMaterials2RQContractsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := TKMaterials2RQContractsFilter.Create;
      FilterObject := TKMaterials2RQContractsFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmTKMaterials2RQContractsFilterEdit.Free;
    frmTKMaterials2RQContractsFilterEdit:=nil;
  end;
end;

procedure TfrmTKMaterials2RQContractsShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.