
unit ShowENPurchasesObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPurchasesObjectController ;


type
  TfrmENPurchasesObjectShow = class(TChildForm)  
  HTTPRIOENPurchasesObject: THTTPRIO;
    ImageList1: TImageList;
    sgENPurchasesObject: TAdvStringGrid;
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
procedure sgENPurchasesObjectTopLeftChanged(Sender: TObject);
procedure sgENPurchasesObjectDblClick(Sender: TObject);
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
 // ENPurchasesObjectObj: ENPurchasesObject;
 // ENPurchasesObjectFilterObj: ENPurchasesObjectFilter;
  
  
implementation

uses Main, EditENPurchasesObject, EditENPurchasesObjectFilter,
  ENElementTypeController, ENConsts;


{$R *.dfm}

var
  //frmENPurchasesObjectShow : TfrmENPurchasesObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPurchasesObjectHeaders: array [1..6] of String =
        ( 'Код'
          ,'Назва'
          ,'Тип обєкту'
          ,'Причина'
          ,'Підрозділ'
          ,'Бюджетотримач'
        );
   

procedure TfrmENPurchasesObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPurchasesObjectShow:=nil;
    inherited;
  end;


procedure TfrmENPurchasesObjectShow.FormShow(Sender: TObject);
var
  TempENPurchasesObject: ENPurchasesObjectControllerSoapPort;
  i: Integer;
  ENPurchasesObjectList: ENPurchasesObjectShortList;
  begin
  SetGridHeaders(ENPurchasesObjectHeaders, sgENPurchasesObject.ColumnHeaders);
  ColCount:=100;
  TempENPurchasesObject :=  HTTPRIOENPurchasesObject as ENPurchasesObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPurchasesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPurchasesObjectList := TempENPurchasesObject.getScrollableFilteredList(ENPurchasesObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPurchasesObjectList.list);

  if LastCount > -1 then
     sgENPurchasesObject.RowCount:=LastCount+2
  else
     sgENPurchasesObject.RowCount:=2;

   with sgENPurchasesObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPurchasesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPurchasesObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPurchasesObjectList.list[i].name;

        Cells[2,i+1] := ENPurchasesObjectList.list[i].elementTypeRefName;

        Cells[3,i+1] := ENPurchasesObjectList.list[i].purchasesReasonName;

        Cells[4,i+1] := ENPurchasesObjectList.list[i].departmentShortName;

        Cells[5,i+1] := ENPurchasesObjectList.list[i].budgetShortName;

        LastRow:=i+1;
        sgENPurchasesObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPurchasesObject.Row:=1;
end;

procedure TfrmENPurchasesObjectShow.sgENPurchasesObjectTopLeftChanged(Sender: TObject);
var
  TempENPurchasesObject: ENPurchasesObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENPurchasesObjectList: ENPurchasesObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPurchasesObject.TopRow + sgENPurchasesObject.VisibleRowCount) = ColCount
  then
    begin
      TempENPurchasesObject :=  HTTPRIOENPurchasesObject as ENPurchasesObjectControllerSoapPort;
      CurrentRow:=sgENPurchasesObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPurchasesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPurchasesObjectList := TempENPurchasesObject.getScrollableFilteredList(ENPurchasesObjectFilter(FilterObject),ColCount-1, 100);



  sgENPurchasesObject.RowCount:=sgENPurchasesObject.RowCount+100;
  LastCount:=High(ENPurchasesObjectList.list);
  with sgENPurchasesObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPurchasesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPurchasesObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPurchasesObjectList.list[i].name;

        Cells[2,i+CurrentRow] := ENPurchasesObjectList.list[i].elementTypeRefName;

        Cells[3,i+CurrentRow] := ENPurchasesObjectList.list[i].purchasesReasonName;

        Cells[4,i+CurrentRow] := ENPurchasesObjectList.list[i].departmentShortName;

        Cells[5,i+CurrentRow] := ENPurchasesObjectList.list[i].budgetShortName;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPurchasesObject.Row:=CurrentRow-5;
   sgENPurchasesObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPurchasesObjectShow.sgENPurchasesObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPurchasesObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPurchasesObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPurchasesObject.RowCount-1 do
   for j:=0 to sgENPurchasesObject.ColCount-1 do
     sgENPurchasesObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPurchasesObjectShow.actViewExecute(Sender: TObject);
Var TempENPurchasesObject: ENPurchasesObjectControllerSoapPort;
begin
 TempENPurchasesObject := HTTPRIOENPurchasesObject as ENPurchasesObjectControllerSoapPort;
   try
     ENPurchasesObjectObj := TempENPurchasesObject.getObject(StrToInt(sgENPurchasesObject.Cells[0,sgENPurchasesObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPurchasesObjectEdit:=TfrmENPurchasesObjectEdit.Create(Application, dsView);
  try
    frmENPurchasesObjectEdit.ShowModal;
  finally
    frmENPurchasesObjectEdit.Free;
    frmENPurchasesObjectEdit:=nil;
  end;
end;

procedure TfrmENPurchasesObjectShow.actEditExecute(Sender: TObject);
Var TempENPurchasesObject: ENPurchasesObjectControllerSoapPort;
begin
 TempENPurchasesObject := HTTPRIOENPurchasesObject as ENPurchasesObjectControllerSoapPort;
   try
     ENPurchasesObjectObj := TempENPurchasesObject.getObject(StrToInt(sgENPurchasesObject.Cells[0,sgENPurchasesObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPurchasesObjectEdit:=TfrmENPurchasesObjectEdit.Create(Application, dsEdit);
  try
    if frmENPurchasesObjectEdit.ShowModal= mrOk then
      begin
        //TempENPurchasesObject.save(ENPurchasesObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPurchasesObjectEdit.Free;
    frmENPurchasesObjectEdit:=nil;
  end;
end;

procedure TfrmENPurchasesObjectShow.actDeleteExecute(Sender: TObject);
Var TempENPurchasesObject: ENPurchasesObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPurchasesObject := HTTPRIOENPurchasesObject as ENPurchasesObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPurchasesObject.Cells[0,sgENPurchasesObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Закупки для Обьектів) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPurchasesObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPurchasesObjectShow.actInsertExecute(Sender: TObject);
Var TempENPurchasesObject: ENPurchasesObjectControllerSoapPort;
begin
  TempENPurchasesObject := HTTPRIOENPurchasesObject as ENPurchasesObjectControllerSoapPort;
  ENPurchasesObjectObj:=ENPurchasesObject.Create;

  if FilterObject = nil then Exit;

  ENPurchasesObjectObj.elementTypeRef := ENElementTypeRef.Create;
  ENPurchasesObjectObj.elementTypeRef.code := ENPurchasesObjectFilter(FilterObject).elementTypeRef.code;

  try
    frmENPurchasesObjectEdit:=TfrmENPurchasesObjectEdit.Create(Application, dsInsert);
    try
      if frmENPurchasesObjectEdit.ShowModal = mrOk then
      begin
        if ENPurchasesObjectObj<>nil then
            //TempENPurchasesObject.add(ENPurchasesObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPurchasesObjectEdit.Free;
      frmENPurchasesObjectEdit:=nil;
    end;
  finally
    ENPurchasesObjectObj.Free;
  end;
end;

procedure TfrmENPurchasesObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPurchasesObjectShow.actFilterExecute(Sender: TObject);
begin

  if FilterObject = nil then Exit;

  frmENPurchasesObjectFilterEdit:=TfrmENPurchasesObjectFilterEdit.Create(Application, dsEdit);
  try
    ENPurchasesObjectFilterObj := ENPurchasesObjectFilter.Create;
    SetNullIntProps(ENPurchasesObjectFilterObj);
    SetNullXSProps(ENPurchasesObjectFilterObj);

    ENPurchasesObjectFilterObj.elementTypeRef := ENElementTypeRef.Create;
    ENPurchasesObjectFilterObj.elementTypeRef.code :=  ENPurchasesObjectFilter(FilterObject).elementTypeRef.code;

    frmENPurchasesObjectFilterEdit.Caption := Caption;

    if frmENPurchasesObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPurchasesObjectFilter.Create;
      FilterObject := ENPurchasesObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPurchasesObjectFilterEdit.Free;
    frmENPurchasesObjectFilterEdit:=nil;
  end;
end;

procedure TfrmENPurchasesObjectShow.actNoFilterExecute(Sender: TObject);
var elementTypeCode: Integer;
begin
  ///// Сохраняем код типа элемента
  elementTypeCode := LOW_INT;

  if FilterObject <> nil then
    if ENPurchasesObjectFilter(FilterObject).elementTypeRef <> nil then
      elementTypeCode := ENPurchasesObjectFilter(FilterObject).elementTypeRef.code;
  /////

  FilterObject.Free;
  FilterObject := nil;

  ///// Пересоздаем фильтр и возвращаем обратно код типа элемента
  FilterObject := ENPurchasesObjectFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);

  ENPurchasesObjectFilter(FilterObject).elementTypeRef := ENElementTypeRef.Create();
  ENPurchasesObjectFilter(FilterObject).elementTypeRef.code := elementTypeCode;
  /////

  UpdateGrid(Sender);
end;

end.