
unit ShowENPurchasesNoObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPurchasesNoObjectController ;


type
  TfrmENPurchasesNoObjectShow = class(TChildForm)  
  HTTPRIOENPurchasesNoObject: THTTPRIO;
    ImageList1: TImageList;
    sgENPurchasesNoObject: TAdvStringGrid;
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
procedure sgENPurchasesNoObjectTopLeftChanged(Sender: TObject);
procedure sgENPurchasesNoObjectDblClick(Sender: TObject);
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
 // ENPurchasesNoObjectObj: ENPurchasesNoObject;
 // ENPurchasesNoObjectFilterObj: ENPurchasesNoObjectFilter;
  
  
implementation

uses Main, EditENPurchasesNoObject, EditENPurchasesNoObjectFilter, ENConsts, 
  ENPurchasesNoObjectTypeController;


{$R *.dfm}

var
  //frmENPurchasesNoObjectShow : TfrmENPurchasesNoObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPurchasesNoObjectHeaders: array [1..4] of String =
        ( 'Код'
          ,'Назва'
          ,'Підрозділ'
          ,'Бюджетотримач'
        );
   

procedure TfrmENPurchasesNoObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPurchasesNoObjectShow:=nil;
    inherited;
  end;


procedure TfrmENPurchasesNoObjectShow.FormShow(Sender: TObject);
var
  TempENPurchasesNoObject: ENPurchasesNoObjectControllerSoapPort;
  i: Integer;
  ENPurchasesNoObjectList: ENPurchasesNoObjectShortList;
  begin
  SetGridHeaders(ENPurchasesNoObjectHeaders, sgENPurchasesNoObject.ColumnHeaders);
  ColCount:=100;
  TempENPurchasesNoObject :=  HTTPRIOENPurchasesNoObject as ENPurchasesNoObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPurchasesNoObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPurchasesNoObjectList := TempENPurchasesNoObject.getScrollableFilteredList(ENPurchasesNoObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPurchasesNoObjectList.list);

  if LastCount > -1 then
     sgENPurchasesNoObject.RowCount:=LastCount+2
  else
     sgENPurchasesNoObject.RowCount:=2;

   with sgENPurchasesNoObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPurchasesNoObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPurchasesNoObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPurchasesNoObjectList.list[i].name;

        Cells[2,i+1] := ENPurchasesNoObjectList.list[i].departmentShortName;

        Cells[3,i+1] := ENPurchasesNoObjectList.list[i].budgetShortName;


        LastRow:=i+1;
        sgENPurchasesNoObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPurchasesNoObject.Row:=1;
end;

procedure TfrmENPurchasesNoObjectShow.sgENPurchasesNoObjectTopLeftChanged(Sender: TObject);
var
  TempENPurchasesNoObject: ENPurchasesNoObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENPurchasesNoObjectList: ENPurchasesNoObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPurchasesNoObject.TopRow + sgENPurchasesNoObject.VisibleRowCount) = ColCount
  then
    begin
      TempENPurchasesNoObject :=  HTTPRIOENPurchasesNoObject as ENPurchasesNoObjectControllerSoapPort;
      CurrentRow:=sgENPurchasesNoObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPurchasesNoObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPurchasesNoObjectList := TempENPurchasesNoObject.getScrollableFilteredList(ENPurchasesNoObjectFilter(FilterObject),ColCount-1, 100);



  sgENPurchasesNoObject.RowCount:=sgENPurchasesNoObject.RowCount+100;
  LastCount:=High(ENPurchasesNoObjectList.list);
  with sgENPurchasesNoObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPurchasesNoObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPurchasesNoObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPurchasesNoObjectList.list[i].name;

        Cells[2,i+CurrentRow] := ENPurchasesNoObjectList.list[i].departmentShortName;

        Cells[3,i+CurrentRow] := ENPurchasesNoObjectList.list[i].budgetShortName;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPurchasesNoObject.Row:=CurrentRow-5;
   sgENPurchasesNoObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPurchasesNoObjectShow.sgENPurchasesNoObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPurchasesNoObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPurchasesNoObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPurchasesNoObject.RowCount-1 do
   for j:=0 to sgENPurchasesNoObject.ColCount-1 do
     sgENPurchasesNoObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPurchasesNoObjectShow.actViewExecute(Sender: TObject);
Var TempENPurchasesNoObject: ENPurchasesNoObjectControllerSoapPort;
begin
 TempENPurchasesNoObject := HTTPRIOENPurchasesNoObject as ENPurchasesNoObjectControllerSoapPort;
   try
     ENPurchasesNoObjectObj := TempENPurchasesNoObject.getObject(StrToInt(sgENPurchasesNoObject.Cells[0,sgENPurchasesNoObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPurchasesNoObjectEdit:=TfrmENPurchasesNoObjectEdit.Create(Application, dsView);
  try
    frmENPurchasesNoObjectEdit.ShowModal;
  finally
    frmENPurchasesNoObjectEdit.Free;
    frmENPurchasesNoObjectEdit:=nil;
  end;
end;

procedure TfrmENPurchasesNoObjectShow.actEditExecute(Sender: TObject);
Var TempENPurchasesNoObject: ENPurchasesNoObjectControllerSoapPort;
begin
 TempENPurchasesNoObject := HTTPRIOENPurchasesNoObject as ENPurchasesNoObjectControllerSoapPort;
   try
     ENPurchasesNoObjectObj := TempENPurchasesNoObject.getObject(StrToInt(sgENPurchasesNoObject.Cells[0,sgENPurchasesNoObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPurchasesNoObjectEdit:=TfrmENPurchasesNoObjectEdit.Create(Application, dsEdit);
  try
    frmENPurchasesNoObjectEdit.Caption := Caption;
    if frmENPurchasesNoObjectEdit.ShowModal= mrOk then
      begin
        //TempENPurchasesNoObject.save(ENPurchasesNoObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPurchasesNoObjectEdit.Free;
    frmENPurchasesNoObjectEdit:=nil;
  end;
end;

procedure TfrmENPurchasesNoObjectShow.actDeleteExecute(Sender: TObject);
Var TempENPurchasesNoObject: ENPurchasesNoObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPurchasesNoObject := HTTPRIOENPurchasesNoObject as ENPurchasesNoObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPurchasesNoObject.Cells[0,sgENPurchasesNoObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить ('+ Caption +') ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPurchasesNoObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPurchasesNoObjectShow.actInsertExecute(Sender: TObject);
Var TempENPurchasesNoObject: ENPurchasesNoObjectControllerSoapPort;
begin

  if FilterObject = nil then Exit;

  TempENPurchasesNoObject := HTTPRIOENPurchasesNoObject as ENPurchasesNoObjectControllerSoapPort;
  ENPurchasesNoObjectObj:=ENPurchasesNoObject.Create;

  ENPurchasesNoObjectObj.typeRef := ENPurchasesNoObjectTypeRef.Create;
  ENPurchasesNoObjectObj.typeRef.code := ENPurchasesNoObjectFilter(FilterObject).typeRef.code;
  
{
    ENOtherObjectObj.typeRef := ENOtherObjectTypeRef.Create();
   ENOtherObjectObj.typeRef.code := ENOtherObjectFilter(FilterObject).typeRef.code;
}

  try
    frmENPurchasesNoObjectEdit:=TfrmENPurchasesNoObjectEdit.Create(Application, dsInsert);
    try

      frmENPurchasesNoObjectEdit.Caption := Caption;

      if frmENPurchasesNoObjectEdit.ShowModal = mrOk then
      begin
        if ENPurchasesNoObjectObj<>nil then
            //TempENPurchasesNoObject.add(ENPurchasesNoObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPurchasesNoObjectEdit.Free;
      frmENPurchasesNoObjectEdit:=nil;
    end;
  finally
    ENPurchasesNoObjectObj.Free;
  end;
end;

procedure TfrmENPurchasesNoObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPurchasesNoObjectShow.actFilterExecute(Sender: TObject);
begin

  if FilterObject = nil then Exit;

  frmENPurchasesNoObjectFilterEdit:=TfrmENPurchasesNoObjectFilterEdit.Create(Application, dsEdit);
  try
    ENPurchasesNoObjectFilterObj := ENPurchasesNoObjectFilter.Create;
    SetNullIntProps(ENPurchasesNoObjectFilterObj);
    SetNullXSProps(ENPurchasesNoObjectFilterObj);

    ENPurchasesNoObjectFilterObj.typeRef := ENPurchasesNoObjectTypeRef.Create;
    ENPurchasesNoObjectFilterObj.typeRef.code := ENPurchasesNoObjectFilter(FilterObject).typeRef.code;

    frmENPurchasesNoObjectFilterEdit.Caption := Caption;

    if frmENPurchasesNoObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPurchasesNoObjectFilter.Create;
      FilterObject := ENPurchasesNoObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPurchasesNoObjectFilterEdit.Free;
    frmENPurchasesNoObjectFilterEdit:=nil;
  end;
end;

procedure TfrmENPurchasesNoObjectShow.actNoFilterExecute(Sender: TObject);
var typeCode: Integer;
begin

  ///// Сохраняем код типа элемента
  typeCode := LOW_INT;

  if FilterObject <> nil then
    if ENPurchasesNoObjectFilter(FilterObject).typeRef <> nil then
      typeCode := ENPurchasesNoObjectFilter(FilterObject).typeRef.code;
  /////

  FilterObject.Free;
  FilterObject := nil;

  ///// Пересоздаем фильтр и возвращаем обратно код типа элемента
  FilterObject := ENPurchasesNoObjectFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);

  ENPurchasesNoObjectFilter(FilterObject).typeRef := ENPurchasesNoObjectTypeRef.Create();
  ENPurchasesNoObjectFilter(FilterObject).typeRef.code := typeCode;
  /////

  UpdateGrid(Sender);

  {
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
  }

end;

end.