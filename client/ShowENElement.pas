
unit ShowENElement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENElementController, AdvObj ;

type
  TfrmENElementShow = class(TChildForm)  
  HTTPRIOENElement: THTTPRIO;
    ImageList1: TImageList;
    sgENElement: TAdvStringGrid;
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
procedure sgENElementTopLeftChanged(Sender: TObject);
procedure sgENElementDblClick(Sender: TObject);
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
   isFiltered, isTransport, isOperative , isWriteOffProtection, isPriconnection : boolean;
   elementType : Integer;
   changeElement : Boolean;
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList(f : ENElementFilter = nil) : ENElementShort; stdcall; static;
 end;

var
 frmENElementShow : TfrmENElementShow;
 // ENElementObj: ENElement;
 // ENElementFilterObj: ENElementFilter;


implementation

uses Main, EditENElement, EditENElementFilter, DMReportsUnit;


{$R *.dfm}

var
  //frmENElementShow : TfrmENElementShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENElementHeaders: array [1..6] of String =
        ( 'Код'
          ,'Найменування'
          ,'Підрозділ'
          ,'инв №'
          ,'Тип об"єкта'
          ,'Бух. назва'
        );

  invNum : String = '';
  objName : String = '';

  ///// 27.04.11
  buhName : String = '';
  /////

  //isFiltered  : boolean = false;

class function TfrmENElementShow.chooseFromList(f : ENElementFilter = nil) : ENElementShort;
var
  f1 : ENElementFilter;
  frmENElementShow : TfrmENElementShow;
  selected : ENElementShort;
  isFiltered : Boolean;
begin
  inherited;
     selected := nil;
     if not Assigned(f) then begin
         f1 := ENElementFilter.Create;
         SetNullXSProps(f1);
         SetNullIntProps(f1);
         isFiltered := false;
     end else begin
       f1 := f;
       isFiltered := true;
     end;
     frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f1);
     frmENElementShow.isFiltered := isFiltered;
       try
          with frmENElementShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENElementShort(sgENElement.Objects[0, sgENElement.Row]);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmENElementShow.Free;
       end;
	   Result := selected;
end;

procedure TfrmENElementShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    isFiltered := false;
    if FormMode = fmChild then
      frmENElementShow:=nil;
    inherited;
  end;


procedure TfrmENElementShow.FormShow(Sender: TObject);
var
  //TempENElement: ENElementControllerSoapPort;
  i: Integer;
  ENElementList: ENElementShortList;
  begin

  //.. при поиске хотят удалить ЭЛЕМЕНТ!! ...
  DisableActions([actInsert, actDelete, actEdit, actView]);

  SetGridHeaders(ENElementHeaders, sgENElement.ColumnHeaders);
  ColCount:=100;
  //TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;


  if FilterObject = nil then
  begin
     FilterObject := ENElementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if not isFiltered then
  begin
     isFiltered := true;
     actFilterExecute(Sender);
     exit;
  end;

  ENElementList := DMReports.searchElements(ENElementFilter(FilterObject), 0, 100, invNum, objName, buhName) ; //TempENElement.getScrollableFilteredList(ENElementFilter(FilterObject),0,ColCount);
  //TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
  //ENElementList := TempENElement.getScrollableFilteredList(ENElementFilter(FilterObject), 0, 100);


  LastCount:=High(ENElementList.list);

  if LastCount > -1 then
     sgENElement.RowCount:=LastCount+2
  else
     sgENElement.RowCount:=2;

   with sgENElement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENElementList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENElementList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENElementList.list[i].objectName;
        Cells[2,i+1] := ENElementList.list[i].renRefName;
        Cells[3,i+1] := ENElementList.list[i].objectInvNumber;

        Cells[4,i+1] := ENElementList.list[i].typeRefName;
        Cells[5,i+1] := ENElementList.list[i].objectBuhName;

        LastRow:=i+1;
        sgENElement.RowCount:=LastRow+1;

        Objects[0,i+1] := ENElementList.list[i];
      end;
   ColCount:=ColCount+1;
   sgENElement.Row:=1;
end;

procedure TfrmENElementShow.sgENElementTopLeftChanged(Sender: TObject);
var
  TempENElement: ENElementControllerSoapPort;
  i,CurrentRow: Integer;
  ENElementList: ENElementShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENElement.TopRow + sgENElement.VisibleRowCount) = ColCount
  then
    begin
      TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
      CurrentRow:=sgENElement.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENElementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENElementList := DMReports.searchElements(ENElementFilter(FilterObject), ColCount-1, 100, invNum, objName, buhName) ; //TempENElement.getScrollableFilteredList(ENElementFilter(FilterObject),ColCount-1, 100);
  //TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
  //ENElementList := TempENElement.getScrollableFilteredList(ENElementFilter(FilterObject), ColCount - 1, 100);




  sgENElement.RowCount:=sgENElement.RowCount+100;
  LastCount:=High(ENElementList.list);
  with sgENElement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENElementList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENElementList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1, i + CurrentRow] := ENElementList.list[i].objectName;

        Cells[2,i + CurrentRow] := ENElementList.list[i].renRefName;

        Cells[3, i + CurrentRow] := ENElementList.list[i].objectInvNumber;

        Cells[4,i + CurrentRow] := ENElementList.list[i].typeRefName;

        Cells[5,i+CurrentRow] := ENElementList.list[i].objectBuhName;

          LastRow:=i+CurrentRow;
         Objects[0,i+CurrentRow] := ENElementList.list[i];
      end;
   ColCount:=ColCount+100;
   sgENElement.Row:=CurrentRow-5;
   sgENElement.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENElementShow.sgENElementDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENElement,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENElementShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENElement.RowCount-1 do
   for j:=0 to sgENElement.ColCount-1 do
   begin
     sgENElement.Cells[j,i]:='';
     sgENElement.Objects[0,i] := nil;
   end;
   FormShow(Sender);
end;

procedure TfrmENElementShow.actViewExecute(Sender: TObject);
Var TempENElement: ENElementControllerSoapPort;
begin
 TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
   try
     ENElementObj := TempENElement.getObject(StrToInt(sgENElement.Cells[0,sgENElement.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENElementEdit:=TfrmENElementEdit.Create(Application, dsView);
  try
    frmENElementEdit.ShowModal;
  finally
    frmENElementEdit.Free;
    frmENElementEdit:=nil;
  end;
end;

procedure TfrmENElementShow.actEditExecute(Sender: TObject);
Var TempENElement: ENElementControllerSoapPort;
begin
 TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
   try
     ENElementObj := TempENElement.getObject(StrToInt(sgENElement.Cells[0,sgENElement.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENElementEdit:=TfrmENElementEdit.Create(Application, dsEdit);
  try
    if frmENElementEdit.ShowModal= mrOk then
      begin
        //TempENElement.save(ENElementObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENElementEdit.Free;
    frmENElementEdit:=nil;
  end;
end;

procedure TfrmENElementShow.actDeleteExecute(Sender: TObject);
Var TempENElement: ENElementControllerSoapPort;
  ObjCode: Integer;
begin
 TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
   try
     ObjCode := StrToInt(sgENElement.Cells[0,sgENElement.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Элемент сети) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENElement.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENElementShow.actInsertExecute(Sender: TObject);
Var TempENElement: ENElementControllerSoapPort;
begin
  TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
  ENElementObj:=ENElement.Create;

   ENElementObj.orderField:= TXSDecimal.Create;


  try
    frmENElementEdit:=TfrmENElementEdit.Create(Application, dsInsert);
    try
      if frmENElementEdit.ShowModal = mrOk then
      begin
        if ENElementObj<>nil then
            //TempENElement.add(ENElementObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENElementEdit.Free;
      frmENElementEdit:=nil;
    end;
  finally
    ENElementObj.Free;
  end;
end;

procedure TfrmENElementShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENElementShow.actFilterExecute(Sender: TObject);
//frmENElementFilterEdit : TfrmENElementFilterEdit
begin
  frmENElementFilterEdit := TfrmENElementFilterEdit.Create(Application, dsInsert);

  try
    ENElementFilterObj := ENElementFilter.Create;
    SetNullIntProps(ENElementFilterObj);
    SetNullXSProps(ENElementFilterObj);

    if isTransport then frmENElementFilterEdit.isTransport := true;
    if isOperative then frmENElementFilterEdit.isOperative := true;
    if isWriteOffProtection then frmENElementFilterEdit.isWriteOffProtection := true;
    if isPriconnection then frmENElementFilterEdit.isPriConnection := True;

    if changeElement then
    begin
     frmENElementFilterEdit.elementType := elementType;
     frmENElementFilterEdit.changeElement := True;
    end;

    if frmENElementFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENElementFilter.Create;
      FilterObject := ENElementFilterObj;
      invNum := frmENElementFilterEdit.edtInvNum.Text;
      objName := frmENElementFilterEdit.edtENElementName.Text;
      ///// 27.04.11
      buhName := frmENElementFilterEdit.edtENElementBuhName.Text;
      /////

      actUpdateExecute(Sender);
    end
    else
    begin
      //etNullIntProps(ENElementFilterObj);
      //SetNullXSProps(ENElementFilterObj);
      //actNoFilterExecute(Sender);

    end;

    //actUpdateExecute(Sender);

  finally
    frmENElementFilterEdit.Free;
    frmENElementFilterEdit:=nil;
  end;
end;

procedure TfrmENElementShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.