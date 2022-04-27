
unit ShowENPlanWorkItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWorkItemController, AdvObj ;


type
  TfrmENPlanWorkItemShow = class(TChildForm)  
  HTTPRIOENPlanWorkItem: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWorkItem: TAdvStringGrid;
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
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENPlanWorkItemTopLeftChanged(Sender: TObject);
procedure sgENPlanWorkItemDblClick(Sender: TObject);
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
   class function chooseFromList(filter : ENPlanWorkItemFilter) : ENPlanWorkItemController.ENPlanWorkItemShort;
 end;

var
 frmENPlanWorkItemShow : TfrmENPlanWorkItemShow;
 // ENPlanWorkItemObj: ENPlanWorkItem;
 // ENPlanWorkItemFilterObj: ENPlanWorkItemFilter;
  
  
implementation

uses Main, EditENPlanWorkItem, EditENPlanWorkItemFilter,
  ENPlanWorkController, ENElementController;


{$R *.dfm}

var
  //frmENPlanWorkItemShow : TfrmENPlanWorkItemShow;

  planItemFilter : ENPlanWorkItemFilter;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWorkItemHeaders: array [1..5] of String =
        ( 'Код'
          ,'Робота'
          ,'кількість'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );

class function TfrmENPlanWorkItemShow.chooseFromList(filter : ENPlanWorkItemFilter) : ENPlanWorkItemController.ENPlanWorkItemShort;
var
  f1 : ENPlanWorkItemFilter;
  frmENPlanWorkItemShow : TfrmENPlanWorkItemShow;
  selected : ENPlanWorkItemController.ENPlanWorkItemShort;
begin
  inherited;
     selected := nil;
     if Assigned(filter) then begin
      f1 := filter;
     end else begin
      f1 := ENPlanWorkItemFilter.Create;
      SetNullXSProps(f1);
      SetNullIntProps(f1);
     end;
     frmENPlanWorkItemShow := TfrmENPlanWorkItemShow.Create(Application, fmNormal, f1);
       try
          with frmENPlanWorkItemShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENPlanWorkItemController.ENPlanWorkItemShort(sgENPlanWorkItem.Objects[0, sgENPlanWorkItem.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENPlanWorkItemShow.Free;
       end;
end;

procedure TfrmENPlanWorkItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWorkItemShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWorkItemShow.FormShow(Sender: TObject);
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  i: Integer;
  ENPlanWorkItemList: ENPlanWorkItemShortList;
  begin
  SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);
  ColCount:=100;
  TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(ENPlanWorkItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWorkItemList.list);

  if LastCount > -1 then
     sgENPlanWorkItem.RowCount:=LastCount+2
  else
     sgENPlanWorkItem.RowCount:=2;

   with sgENPlanWorkItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENPlanWorkItemList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENPlanWorkItemList.list[i].kartaRefName;

        if ENPlanWorkItemList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENPlanWorkItemList.list[i].countGen.DecimalString;

        Cells[3,i+1] := ENPlanWorkItemList.list[i].userGen;
        if ENPlanWorkItemList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENPlanWorkItemList.list[i].dateEdit);
        Objects[0, i+1] := ENPlanWorkItemList.list[i];
        LastRow:=i+1;
        sgENPlanWorkItem.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWorkItem.Row:=1;
end;

procedure TfrmENPlanWorkItemShow.sgENPlanWorkItemTopLeftChanged(Sender: TObject);
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWorkItemList: ENPlanWorkItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWorkItem.TopRow + sgENPlanWorkItem.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
      CurrentRow:=sgENPlanWorkItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWorkItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(ENPlanWorkItemFilter(FilterObject),ColCount-1, 100);



  sgENPlanWorkItem.RowCount:=sgENPlanWorkItem.RowCount+100;
  LastCount:=High(ENPlanWorkItemList.list);
  with sgENPlanWorkItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWorkItemList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWorkItemList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENPlanWorkItemList.list[i].countGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := ENPlanWorkItemList.list[i].countGen.DecimalString;
        Cells[2,i+CurrentRow] := ENPlanWorkItemList.list[i].userGen;
        if ENPlanWorkItemList.list[i].dateEdit = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(ENPlanWorkItemList.list[i].dateEdit);
        Objects[0, i+CurrentRow] := ENPlanWorkItemList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWorkItem.Row:=CurrentRow-5;
   sgENPlanWorkItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWorkItemShow.sgENPlanWorkItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWorkItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanWorkItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWorkItem.RowCount-1 do
   for j:=0 to sgENPlanWorkItem.ColCount-1 do
     sgENPlanWorkItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWorkItemShow.actViewExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin
 TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
   try
     ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsView);
  try
    frmENPlanWorkItemEdit.ShowModal;
  finally
    frmENPlanWorkItemEdit.Free;
    frmENPlanWorkItemEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkItemShow.actEditExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin
 TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
   try
     ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkItemEdit.ShowModal= mrOk then
      begin
        //TempENPlanWorkItem.save(ENPlanWorkItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWorkItemEdit.Free;
    frmENPlanWorkItemEdit:=nil;
  end;
end;

procedure TfrmENPlanWorkItemShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  ObjCode: Integer;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    TempENElement: ENElementControllerSoapPort;
    element : ENElement;
    plan : ENPlanWork;

begin
 TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пункти плану робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты

    TempENPlanWorkItem.remove(ObjCode);

    { все уже не так .. см контроллер на сервере ..

    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    plan := TempENPlanWork.getObject(ENPlanWorkItemObj.planRef.code);

    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
    element := TempENElement.getObject(plan.elementRef.code);
      if element.typeRef.code in [1,2,3] then
        TempENPlanWorkItem.removeBySRS(ObjCode)
      else
      if element.typeRef.code = 5 then
        TempENPlanWorkItem.removeBySVES(ObjCode)
      else if element.typeRef.code = 6 then
        TempENPlanWorkItem.removeBySPS(ObjCode)
      else
      begin
        Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
        exit;
      end;
      }
      //TempENPlanWorkItem.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWorkItemShow.actInsertExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin
  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  ENPlanWorkItemObj:=ENPlanWorkItem.Create;

   ENPlanWorkItemObj.countGen:= TXSDecimal.Create;
   ENPlanWorkItemObj.dateEdit:= TXSDate.Create;


  try
    frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsInsert);
    try
      if frmENPlanWorkItemEdit.ShowModal = mrOk then
      begin
        if ENPlanWorkItemObj<>nil then
            //TempENPlanWorkItem.add(ENPlanWorkItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkItemEdit.Free;
      frmENPlanWorkItemEdit:=nil;
    end;
  finally
    ENPlanWorkItemObj.Free;
  end;
end;

procedure TfrmENPlanWorkItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWorkItemShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWorkItemFilterEdit:=TfrmENPlanWorkItemFilterEdit.Create(Application, dsEdit);
  try
    if frmENPlanWorkItemFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENPlanWorkItemFilter.Create;
      FilterObject := ENPlanWorkItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWorkItemFilterEdit.Free;
    frmENPlanWorkItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWorkItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.