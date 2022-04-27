
unit ShowENPlanProjectTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENPlanProjectTemplateController, AdvObj ;


type
    TfrmENPlanProjectTemplateShow = class(TChildForm)  
    HTTPRIOENPlanProjectTemplate: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanProjectTemplate: TAdvStringGrid;
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
    procedure sgENPlanProjectTemplateTopLeftChanged(Sender: TObject);
    procedure sgENPlanProjectTemplateDblClick(Sender: TObject);
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

var
 frmENPlanProjectTemplateShow : TfrmENPlanProjectTemplateShow;
 // ENPlanProjectTemplateObj: ENPlanProjectTemplate;
 // ENPlanProjectTemplateFilterObj: ENPlanProjectTemplateFilter;
  
  
implementation

uses Main, EditENPlanProjectTemplate, EditENPlanProjectTemplateFilter;


{$R *.dfm}

var
  //frmENPlanProjectTemplateShow : TfrmENPlanProjectTemplateShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanProjectTemplateHeaders: array [1..6] of String =
        ( 'Код'
          ,'тэг'
          ,'название елемента сети или опоры'
          ,'код елемента сети или опоры'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
   

procedure TfrmENPlanProjectTemplateShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENPlanProjectTemplateShow:=nil;
  inherited;
end;


procedure TfrmENPlanProjectTemplateShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENPlanProjectTemplateShow.FormShow(Sender: TObject);
var
  TempENPlanProjectTemplate: ENPlanProjectTemplateControllerSoapPort;
  i: Integer;
  ENPlanProjectTemplateList: ENPlanProjectTemplateShortList;
begin
  SetGridHeaders(ENPlanProjectTemplateHeaders, sgENPlanProjectTemplate.ColumnHeaders);
  ColCount:=100;
  TempENPlanProjectTemplate :=  HTTPRIOENPlanProjectTemplate as ENPlanProjectTemplateControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanProjectTemplateFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanProjectTemplateList := TempENPlanProjectTemplate.getScrollableFilteredList(ENPlanProjectTemplateFilter(FilterObject),0,ColCount);
  LastCount:=High(ENPlanProjectTemplateList.list);

  if LastCount > -1 then
     sgENPlanProjectTemplate.RowCount:=LastCount+2
  else
     sgENPlanProjectTemplate.RowCount:=2;

   with sgENPlanProjectTemplate do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanProjectTemplateList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanProjectTemplateList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanProjectTemplateList.list[i].tag;
        Cells[2,i+1] := ENPlanProjectTemplateList.list[i].elementName;
        if ENPlanProjectTemplateList.list[i].elementcode = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENPlanProjectTemplateList.list[i].elementcode);
        Cells[4,i+1] := ENPlanProjectTemplateList.list[i].userGen;
        if ENPlanProjectTemplateList.list[i].dateEdit = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENPlanProjectTemplateList.list[i].dateEdit);
        LastRow:=i+1;
        sgENPlanProjectTemplate.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENPlanProjectTemplate.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENPlanProjectTemplate.RowCount > selectedRow then
      sgENPlanProjectTemplate.Row := selectedRow
    else
      sgENPlanProjectTemplate.Row := sgENPlanProjectTemplate.RowCount - 1;
    end
    else
      sgENPlanProjectTemplate.Row:=1;   
end;


procedure TfrmENPlanProjectTemplateShow.sgENPlanProjectTemplateTopLeftChanged(Sender: TObject);
var
  TempENPlanProjectTemplate: ENPlanProjectTemplateControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanProjectTemplateList: ENPlanProjectTemplateShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanProjectTemplate.TopRow + sgENPlanProjectTemplate.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanProjectTemplate :=  HTTPRIOENPlanProjectTemplate as ENPlanProjectTemplateControllerSoapPort;
      CurrentRow:=sgENPlanProjectTemplate.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanProjectTemplateFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanProjectTemplateList := TempENPlanProjectTemplate.getScrollableFilteredList(ENPlanProjectTemplateFilter(FilterObject),ColCount-1, 100);


  sgENPlanProjectTemplate.RowCount:=sgENPlanProjectTemplate.RowCount+100;
  LastCount:=High(ENPlanProjectTemplateList.list);
  with sgENPlanProjectTemplate do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanProjectTemplateList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanProjectTemplateList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanProjectTemplateList.list[i].tag;
        Cells[2,i+CurrentRow] := ENPlanProjectTemplateList.list[i].elementName;
        if ENPlanProjectTemplateList.list[i].elementcode = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENPlanProjectTemplateList.list[i].elementcode);
        Cells[4,i+CurrentRow] := ENPlanProjectTemplateList.list[i].userGen;
        if ENPlanProjectTemplateList.list[i].dateEdit = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(ENPlanProjectTemplateList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanProjectTemplate.Row:=CurrentRow-5;
   sgENPlanProjectTemplate.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanProjectTemplateShow.sgENPlanProjectTemplateDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanProjectTemplate,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENPlanProjectTemplateShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENPlanProjectTemplate.RowCount-1 do
   for j:=0 to sgENPlanProjectTemplate.ColCount-1 do
     sgENPlanProjectTemplate.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENPlanProjectTemplateShow.actViewExecute(Sender: TObject);
var 
  TempENPlanProjectTemplate: ENPlanProjectTemplateControllerSoapPort;
begin
  TempENPlanProjectTemplate := HTTPRIOENPlanProjectTemplate as ENPlanProjectTemplateControllerSoapPort;
  try
    ENPlanProjectTemplateObj := TempENPlanProjectTemplate.getObject(StrToInt(sgENPlanProjectTemplate.Cells[0,sgENPlanProjectTemplate.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPlanProjectTemplate.Row;
  frmENPlanProjectTemplateEdit:=TfrmENPlanProjectTemplateEdit.Create(Application, dsView);
  
  try
    frmENPlanProjectTemplateEdit.ShowModal;
  finally
    frmENPlanProjectTemplateEdit.Free;
    frmENPlanProjectTemplateEdit:=nil;
  end;

  if sgENPlanProjectTemplate.RowCount > selectedRow then
    sgENPlanProjectTemplate.Row := selectedRow
  else
    sgENPlanProjectTemplate.Row := sgENPlanProjectTemplate.RowCount - 1;
  
end;


procedure TfrmENPlanProjectTemplateShow.actEditExecute(Sender: TObject);
var 
  TempENPlanProjectTemplate: ENPlanProjectTemplateControllerSoapPort;
begin
  TempENPlanProjectTemplate := HTTPRIOENPlanProjectTemplate as ENPlanProjectTemplateControllerSoapPort;
  try
    ENPlanProjectTemplateObj := TempENPlanProjectTemplate.getObject(StrToInt(sgENPlanProjectTemplate.Cells[0,sgENPlanProjectTemplate.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPlanProjectTemplate.Row;
  frmENPlanProjectTemplateEdit:=TfrmENPlanProjectTemplateEdit.Create(Application, dsEdit);
  
  try
    if frmENPlanProjectTemplateEdit.ShowModal= mrOk then
      begin
        //TempENPlanProjectTemplate.save(ENPlanProjectTemplateObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanProjectTemplateEdit.Free;
    frmENPlanProjectTemplateEdit:=nil;
  end;

  if sgENPlanProjectTemplate.RowCount > selectedRow then
    sgENPlanProjectTemplate.Row := selectedRow
  else
    sgENPlanProjectTemplate.Row := sgENPlanProjectTemplate.RowCount - 1;
  
end;


procedure TfrmENPlanProjectTemplateShow.actDeleteExecute(Sender: TObject);
Var TempENPlanProjectTemplate: ENPlanProjectTemplateControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanProjectTemplate := HTTPRIOENPlanProjectTemplate as ENPlanProjectTemplateControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanProjectTemplate.Cells[0,sgENPlanProjectTemplate.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строки тегов для названия работы по проектированию) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanProjectTemplate.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanProjectTemplateShow.actInsertExecute(Sender: TObject);
// Var TempENPlanProjectTemplate: ENPlanProjectTemplateControllerSoapPort; 
begin
  // TempENPlanProjectTemplate := HTTPRIOENPlanProjectTemplate as ENPlanProjectTemplateControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPlanProjectTemplateObj:=ENPlanProjectTemplate.Create;
  SetNullIntProps(ENPlanProjectTemplateObj);
  SetNullXSProps(ENPlanProjectTemplateObj);

   //ENPlanProjectTemplateObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENPlanProjectTemplateEdit:=TfrmENPlanProjectTemplateEdit.Create(Application, dsInsert);
    try
      if frmENPlanProjectTemplateEdit.ShowModal = mrOk then
      begin
        if ENPlanProjectTemplateObj<>nil then
            //TempENPlanProjectTemplate.add(ENPlanProjectTemplateObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanProjectTemplateEdit.Free;
      frmENPlanProjectTemplateEdit:=nil;
    end;
  finally
    ENPlanProjectTemplateObj.Free;
  end;
end;


procedure TfrmENPlanProjectTemplateShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENPlanProjectTemplateShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanProjectTemplateFilterEdit:=TfrmENPlanProjectTemplateFilterEdit.Create(Application, dsInsert);
  try
    ENPlanProjectTemplateFilterObj := ENPlanProjectTemplateFilter.Create;
    SetNullIntProps(ENPlanProjectTemplateFilterObj);
    SetNullXSProps(ENPlanProjectTemplateFilterObj);

    if frmENPlanProjectTemplateFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENPlanProjectTemplateFilter.Create;
      FilterObject := ENPlanProjectTemplateFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanProjectTemplateFilterEdit.Free;
    frmENPlanProjectTemplateFilterEdit:=nil;
  end;}
end;


procedure TfrmENPlanProjectTemplateShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.