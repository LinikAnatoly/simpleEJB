
unit ShowENSITEquipType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSITEquipTypeController ;


type
  TfrmENSITEquipTypeShow = class(TChildForm)  
  HTTPRIOENSITEquipType: THTTPRIO;
    ImageList1: TImageList;
    sgENSITEquipType: TAdvStringGrid;
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
procedure sgENSITEquipTypeTopLeftChanged(Sender: TObject);
procedure sgENSITEquipTypeDblClick(Sender: TObject);
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
 // ENSITEquipTypeObj: ENSITEquipType;
 // ENSITEquipTypeFilterObj: ENSITEquipTypeFilter;
  
  
implementation

uses Main, EditENSITEquipType, EditENSITEquipTypeFilter;


{$R *.dfm}

var
  //frmENSITEquipTypeShow : TfrmENSITEquipTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSITEquipTypeHeaders: array [1..3] of String =
        ( 'Код'
          ,'Тип обьекту СІТ'
          ,'Описание'
        );
   

procedure TfrmENSITEquipTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSITEquipTypeShow:=nil;
    inherited;
  end;


procedure TfrmENSITEquipTypeShow.FormShow(Sender: TObject);
var
  TempENSITEquipType: ENSITEquipTypeControllerSoapPort;
  i: Integer;
  ENSITEquipTypeList: ENSITEquipTypeShortList;
  begin
  SetGridHeaders(ENSITEquipTypeHeaders, sgENSITEquipType.ColumnHeaders);
  ColCount:=100;
  TempENSITEquipType :=  HTTPRIOENSITEquipType as ENSITEquipTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSITEquipTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITEquipTypeList := TempENSITEquipType.getScrollableFilteredList(ENSITEquipTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSITEquipTypeList.list);

  if LastCount > -1 then
     sgENSITEquipType.RowCount:=LastCount+2
  else
     sgENSITEquipType.RowCount:=2;

   with sgENSITEquipType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITEquipTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSITEquipTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSITEquipTypeList.list[i].name;
        Cells[2,i+1] := ENSITEquipTypeList.list[i].description;
        LastRow:=i+1;
        sgENSITEquipType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSITEquipType.Row:=1;
end;

procedure TfrmENSITEquipTypeShow.sgENSITEquipTypeTopLeftChanged(Sender: TObject);
var
  TempENSITEquipType: ENSITEquipTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSITEquipTypeList: ENSITEquipTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSITEquipType.TopRow + sgENSITEquipType.VisibleRowCount) = ColCount
  then
    begin
      TempENSITEquipType :=  HTTPRIOENSITEquipType as ENSITEquipTypeControllerSoapPort;
      CurrentRow:=sgENSITEquipType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSITEquipTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITEquipTypeList := TempENSITEquipType.getScrollableFilteredList(ENSITEquipTypeFilter(FilterObject),ColCount-1, 100);



  sgENSITEquipType.RowCount:=sgENSITEquipType.RowCount+100;
  LastCount:=High(ENSITEquipTypeList.list);
  with sgENSITEquipType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITEquipTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSITEquipTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSITEquipTypeList.list[i].name;
        Cells[2,i+CurrentRow] := ENSITEquipTypeList.list[i].description;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSITEquipType.Row:=CurrentRow-5;
   sgENSITEquipType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSITEquipTypeShow.sgENSITEquipTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSITEquipType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSITEquipTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSITEquipType.RowCount-1 do
   for j:=0 to sgENSITEquipType.ColCount-1 do
     sgENSITEquipType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSITEquipTypeShow.actViewExecute(Sender: TObject);
Var TempENSITEquipType: ENSITEquipTypeControllerSoapPort;
begin
 TempENSITEquipType := HTTPRIOENSITEquipType as ENSITEquipTypeControllerSoapPort;
   try
     ENSITEquipTypeObj := TempENSITEquipType.getObject(StrToInt(sgENSITEquipType.Cells[0,sgENSITEquipType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITEquipTypeEdit:=TfrmENSITEquipTypeEdit.Create(Application, dsView);
  try
    frmENSITEquipTypeEdit.ShowModal;
  finally
    frmENSITEquipTypeEdit.Free;
    frmENSITEquipTypeEdit:=nil;
  end;
end;

procedure TfrmENSITEquipTypeShow.actEditExecute(Sender: TObject);
Var TempENSITEquipType: ENSITEquipTypeControllerSoapPort;
begin
 TempENSITEquipType := HTTPRIOENSITEquipType as ENSITEquipTypeControllerSoapPort;
   try
     ENSITEquipTypeObj := TempENSITEquipType.getObject(StrToInt(sgENSITEquipType.Cells[0,sgENSITEquipType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITEquipTypeEdit:=TfrmENSITEquipTypeEdit.Create(Application, dsEdit);
  try
    if frmENSITEquipTypeEdit.ShowModal= mrOk then
      begin
        //TempENSITEquipType.save(ENSITEquipTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSITEquipTypeEdit.Free;
    frmENSITEquipTypeEdit:=nil;
  end;
end;

procedure TfrmENSITEquipTypeShow.actDeleteExecute(Sender: TObject);
Var TempENSITEquipType: ENSITEquipTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSITEquipType := HTTPRIOENSITEquipType as ENSITEquipTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSITEquipType.Cells[0,sgENSITEquipType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип обьекту СІТ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSITEquipType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSITEquipTypeShow.actInsertExecute(Sender: TObject);
Var TempENSITEquipType: ENSITEquipTypeControllerSoapPort;
begin
  TempENSITEquipType := HTTPRIOENSITEquipType as ENSITEquipTypeControllerSoapPort;
  ENSITEquipTypeObj:=ENSITEquipType.Create;



  try
    frmENSITEquipTypeEdit:=TfrmENSITEquipTypeEdit.Create(Application, dsInsert);
    try
      if frmENSITEquipTypeEdit.ShowModal = mrOk then
      begin
        if ENSITEquipTypeObj<>nil then
            //TempENSITEquipType.add(ENSITEquipTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSITEquipTypeEdit.Free;
      frmENSITEquipTypeEdit:=nil;
    end;
  finally
    ENSITEquipTypeObj.Free;
  end;
end;

procedure TfrmENSITEquipTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSITEquipTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENSITEquipTypeFilterEdit:=TfrmENSITEquipTypeFilterEdit.Create(Application, dsEdit);
  try
    ENSITEquipTypeFilterObj := ENSITEquipTypeFilter.Create;
    SetNullIntProps(ENSITEquipTypeFilterObj);
    SetNullXSProps(ENSITEquipTypeFilterObj);

    if frmENSITEquipTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSITEquipTypeFilter.Create;
      FilterObject := ENSITEquipTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSITEquipTypeFilterEdit.Free;
    frmENSITEquipTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENSITEquipTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.