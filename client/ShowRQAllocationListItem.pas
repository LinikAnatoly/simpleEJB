
unit ShowRQAllocationListItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQAllocationListItemController, AdvObj ;


type
  TfrmRQAllocationListItemShow = class(TChildForm)  
  HTTPRIORQAllocationListItem: THTTPRIO;
    ImageList1: TImageList;
    sgRQAllocationListItem: TAdvStringGrid;
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
procedure sgRQAllocationListItemTopLeftChanged(Sender: TObject);
procedure sgRQAllocationListItemDblClick(Sender: TObject);
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
 // RQAllocationListItemObj: RQAllocationListItem;
 // RQAllocationListItemFilterObj: RQAllocationListItemFilter;
  
  
implementation

uses Main, EditRQAllocationListItem, EditRQAllocationListItemFilter;


{$R *.dfm}

var
  //frmRQAllocationListItemShow : TfrmRQAllocationListItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQAllocationListItemHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва матеріалу'
          ,'Назва одиниці виміру'
          ,'Необхідна кількість'
          ,'Прив’язана кількість з залишків'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmRQAllocationListItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQAllocationListItemShow:=nil;
    inherited;
  end;


procedure TfrmRQAllocationListItemShow.FormShow(Sender: TObject);
var
  TempRQAllocationListItem: RQAllocationListItemControllerSoapPort;
  i: Integer;
  RQAllocationListItemList: RQAllocationListItemShortList;
  begin
  SetGridHeaders(RQAllocationListItemHeaders, sgRQAllocationListItem.ColumnHeaders);
  ColCount:=100;
  TempRQAllocationListItem :=  HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQAllocationListItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQAllocationListItemList := TempRQAllocationListItem.getScrollableFilteredList(RQAllocationListItemFilter(FilterObject),0,ColCount);


  LastCount:=High(RQAllocationListItemList.list);

  if LastCount > -1 then
     sgRQAllocationListItem.RowCount:=LastCount+2
  else
     sgRQAllocationListItem.RowCount:=2;

   with sgRQAllocationListItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQAllocationListItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQAllocationListItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQAllocationListItemList.list[i].materialName;
        Cells[2,i+1] := RQAllocationListItemList.list[i].measurementName;
        if RQAllocationListItemList.list[i].countGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := RQAllocationListItemList.list[i].countGen.DecimalString;
        if RQAllocationListItemList.list[i].countFact = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := RQAllocationListItemList.list[i].countFact.DecimalString;
        Cells[5,i+1] := RQAllocationListItemList.list[i].userGen;
        if RQAllocationListItemList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(RQAllocationListItemList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQAllocationListItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQAllocationListItem.Row:=1;
end;

procedure TfrmRQAllocationListItemShow.sgRQAllocationListItemTopLeftChanged(Sender: TObject);
var
  TempRQAllocationListItem: RQAllocationListItemControllerSoapPort;
  i,CurrentRow: Integer;
  RQAllocationListItemList: RQAllocationListItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQAllocationListItem.TopRow + sgRQAllocationListItem.VisibleRowCount) = ColCount
  then
    begin
      TempRQAllocationListItem :=  HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;
      CurrentRow:=sgRQAllocationListItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQAllocationListItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQAllocationListItemList := TempRQAllocationListItem.getScrollableFilteredList(RQAllocationListItemFilter(FilterObject),ColCount-1, 100);



  sgRQAllocationListItem.RowCount:=sgRQAllocationListItem.RowCount+100;
  LastCount:=High(RQAllocationListItemList.list);
  with sgRQAllocationListItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQAllocationListItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQAllocationListItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQAllocationListItemList.list[i].materialName;
        Cells[2,i+CurrentRow] := RQAllocationListItemList.list[i].measurementName;
        if RQAllocationListItemList.list[i].countGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := RQAllocationListItemList.list[i].countGen.DecimalString;
        if RQAllocationListItemList.list[i].countFact = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQAllocationListItemList.list[i].countFact.DecimalString;
        Cells[5,i+CurrentRow] := RQAllocationListItemList.list[i].userGen;
        if RQAllocationListItemList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := XSDate2String(RQAllocationListItemList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQAllocationListItem.Row:=CurrentRow-5;
   sgRQAllocationListItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQAllocationListItemShow.sgRQAllocationListItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQAllocationListItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQAllocationListItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQAllocationListItem.RowCount-1 do
   for j:=0 to sgRQAllocationListItem.ColCount-1 do
     sgRQAllocationListItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQAllocationListItemShow.actViewExecute(Sender: TObject);
Var TempRQAllocationListItem: RQAllocationListItemControllerSoapPort;
begin
 TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;
   try
     RQAllocationListItemObj := TempRQAllocationListItem.getObject(StrToInt(sgRQAllocationListItem.Cells[0,sgRQAllocationListItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQAllocationListItemEdit:=TfrmRQAllocationListItemEdit.Create(Application, dsView);
  try
    frmRQAllocationListItemEdit.ShowModal;
  finally
    frmRQAllocationListItemEdit.Free;
    frmRQAllocationListItemEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListItemShow.actEditExecute(Sender: TObject);
Var TempRQAllocationListItem: RQAllocationListItemControllerSoapPort;
begin
 TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;
   try
     RQAllocationListItemObj := TempRQAllocationListItem.getObject(StrToInt(sgRQAllocationListItem.Cells[0,sgRQAllocationListItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQAllocationListItemEdit:=TfrmRQAllocationListItemEdit.Create(Application, dsEdit);
  try
    if frmRQAllocationListItemEdit.ShowModal= mrOk then
      begin
        //TempRQAllocationListItem.save(RQAllocationListItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQAllocationListItemEdit.Free;
    frmRQAllocationListItemEdit:=nil;
  end;
end;

procedure TfrmRQAllocationListItemShow.actDeleteExecute(Sender: TObject);
Var TempRQAllocationListItem: RQAllocationListItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQAllocationListItem.Cells[0,sgRQAllocationListItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки відомості розподілу залишків) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQAllocationListItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQAllocationListItemShow.actInsertExecute(Sender: TObject);
// Var TempRQAllocationListItem: RQAllocationListItemControllerSoapPort; 
begin
  // TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQAllocationListItemObj:=RQAllocationListItem.Create;

   //RQAllocationListItemObj.countGen:= TXSDecimal.Create;
   //RQAllocationListItemObj.countFact:= TXSDecimal.Create;
   //RQAllocationListItemObj.dateEdit:= TXSDate.Create;


  try
    frmRQAllocationListItemEdit:=TfrmRQAllocationListItemEdit.Create(Application, dsInsert);
    try
      if frmRQAllocationListItemEdit.ShowModal = mrOk then
      begin
        if RQAllocationListItemObj<>nil then
            //TempRQAllocationListItem.add(RQAllocationListItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQAllocationListItemEdit.Free;
      frmRQAllocationListItemEdit:=nil;
    end;
  finally
    RQAllocationListItemObj.Free;
  end;
end;

procedure TfrmRQAllocationListItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQAllocationListItemShow.actFilterExecute(Sender: TObject);
begin
{frmRQAllocationListItemFilterEdit:=TfrmRQAllocationListItemFilterEdit.Create(Application, dsInsert);
  try
    RQAllocationListItemFilterObj := RQAllocationListItemFilter.Create;
    SetNullIntProps(RQAllocationListItemFilterObj);
    SetNullXSProps(RQAllocationListItemFilterObj);

    if frmRQAllocationListItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQAllocationListItemFilter.Create;
      FilterObject := RQAllocationListItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQAllocationListItemFilterEdit.Free;
    frmRQAllocationListItemFilterEdit:=nil;
  end;}
end;

procedure TfrmRQAllocationListItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.