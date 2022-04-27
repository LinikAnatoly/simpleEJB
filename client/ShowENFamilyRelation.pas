
unit ShowENFamilyRelation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFamilyRelationController, AdvObj ;


type
  TfrmENFamilyRelationShow = class(TChildForm)  
  HTTPRIOENFamilyRelation: THTTPRIO;
    ImageList1: TImageList;
    sgENFamilyRelation: TAdvStringGrid;
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
procedure sgENFamilyRelationTopLeftChanged(Sender: TObject);
procedure sgENFamilyRelationDblClick(Sender: TObject);
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
 // ENFamilyRelationObj: ENFamilyRelation;
 // ENFamilyRelationFilterObj: ENFamilyRelationFilter;
 frmENFamilyRelationShow : TfrmENFamilyRelationShow;
  
  
implementation

uses Main, EditENFamilyRelation, EditENFamilyRelationFilter;


{$R *.dfm}

var
  //frmENFamilyRelationShow : TfrmENFamilyRelationShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFamilyRelationHeaders: array [1..2] of String =
        ( 'Код'
          ,'Сімейне відношення'
        );
   

procedure TfrmENFamilyRelationShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFamilyRelationShow:=nil;
    inherited;
  end;


procedure TfrmENFamilyRelationShow.FormShow(Sender: TObject);
var
  TempENFamilyRelation: ENFamilyRelationControllerSoapPort;
  i: Integer;
  ENFamilyRelationList: ENFamilyRelationShortList;
  begin
  SetGridHeaders(ENFamilyRelationHeaders, sgENFamilyRelation.ColumnHeaders);
  ColCount:=100;
  TempENFamilyRelation :=  HTTPRIOENFamilyRelation as ENFamilyRelationControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFamilyRelationFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFamilyRelationList := TempENFamilyRelation.getScrollableFilteredList(ENFamilyRelationFilter(FilterObject),0,ColCount);


  LastCount:=High(ENFamilyRelationList.list);

  if LastCount > -1 then
     sgENFamilyRelation.RowCount:=LastCount+2
  else
     sgENFamilyRelation.RowCount:=2;

   with sgENFamilyRelation do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFamilyRelationList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFamilyRelationList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENFamilyRelationList.list[i].relation;
        LastRow:=i+1;
        sgENFamilyRelation.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENFamilyRelation.Row:=1;
end;

procedure TfrmENFamilyRelationShow.sgENFamilyRelationTopLeftChanged(Sender: TObject);
var
  TempENFamilyRelation: ENFamilyRelationControllerSoapPort;
  i,CurrentRow: Integer;
  ENFamilyRelationList: ENFamilyRelationShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFamilyRelation.TopRow + sgENFamilyRelation.VisibleRowCount) = ColCount
  then
    begin
      TempENFamilyRelation :=  HTTPRIOENFamilyRelation as ENFamilyRelationControllerSoapPort;
      CurrentRow:=sgENFamilyRelation.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFamilyRelationFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFamilyRelationList := TempENFamilyRelation.getScrollableFilteredList(ENFamilyRelationFilter(FilterObject),ColCount-1, 100);



  sgENFamilyRelation.RowCount:=sgENFamilyRelation.RowCount+100;
  LastCount:=High(ENFamilyRelationList.list);
  with sgENFamilyRelation do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFamilyRelationList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFamilyRelationList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENFamilyRelationList.list[i].relation;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFamilyRelation.Row:=CurrentRow-5;
   sgENFamilyRelation.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFamilyRelationShow.sgENFamilyRelationDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFamilyRelation,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFamilyRelationShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFamilyRelation.RowCount-1 do
   for j:=0 to sgENFamilyRelation.ColCount-1 do
     sgENFamilyRelation.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFamilyRelationShow.actViewExecute(Sender: TObject);
Var TempENFamilyRelation: ENFamilyRelationControllerSoapPort;
begin
 TempENFamilyRelation := HTTPRIOENFamilyRelation as ENFamilyRelationControllerSoapPort;
   try
     ENFamilyRelationObj := TempENFamilyRelation.getObject(StrToInt(sgENFamilyRelation.Cells[0,sgENFamilyRelation.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFamilyRelationEdit:=TfrmENFamilyRelationEdit.Create(Application, dsView);
  try
    frmENFamilyRelationEdit.ShowModal;
  finally
    frmENFamilyRelationEdit.Free;
    frmENFamilyRelationEdit:=nil;
  end;
end;

procedure TfrmENFamilyRelationShow.actEditExecute(Sender: TObject);
Var TempENFamilyRelation: ENFamilyRelationControllerSoapPort;
begin
 TempENFamilyRelation := HTTPRIOENFamilyRelation as ENFamilyRelationControllerSoapPort;
   try
     ENFamilyRelationObj := TempENFamilyRelation.getObject(StrToInt(sgENFamilyRelation.Cells[0,sgENFamilyRelation.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFamilyRelationEdit:=TfrmENFamilyRelationEdit.Create(Application, dsEdit);
  try
    if frmENFamilyRelationEdit.ShowModal= mrOk then
      begin
        //TempENFamilyRelation.save(ENFamilyRelationObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFamilyRelationEdit.Free;
    frmENFamilyRelationEdit:=nil;
  end;
end;

procedure TfrmENFamilyRelationShow.actDeleteExecute(Sender: TObject);
Var TempENFamilyRelation: ENFamilyRelationControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFamilyRelation := HTTPRIOENFamilyRelation as ENFamilyRelationControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFamilyRelation.Cells[0,sgENFamilyRelation.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Сімейне відношення) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFamilyRelation.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFamilyRelationShow.actInsertExecute(Sender: TObject);
// Var TempENFamilyRelation: ENFamilyRelationControllerSoapPort; 
begin
  // TempENFamilyRelation := HTTPRIOENFamilyRelation as ENFamilyRelationControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENFamilyRelationObj:=ENFamilyRelation.Create;



  try
    frmENFamilyRelationEdit:=TfrmENFamilyRelationEdit.Create(Application, dsInsert);
    try
      if frmENFamilyRelationEdit.ShowModal = mrOk then
      begin
        if ENFamilyRelationObj<>nil then
            //TempENFamilyRelation.add(ENFamilyRelationObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFamilyRelationEdit.Free;
      frmENFamilyRelationEdit:=nil;
    end;
  finally
    ENFamilyRelationObj.Free;
  end;
end;

procedure TfrmENFamilyRelationShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFamilyRelationShow.actFilterExecute(Sender: TObject);
begin
{frmENFamilyRelationFilterEdit:=TfrmENFamilyRelationFilterEdit.Create(Application, dsInsert);
  try
    ENFamilyRelationFilterObj := ENFamilyRelationFilter.Create;
    SetNullIntProps(ENFamilyRelationFilterObj);
    SetNullXSProps(ENFamilyRelationFilterObj);

    if frmENFamilyRelationFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFamilyRelationFilter.Create;
      FilterObject := ENFamilyRelationFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFamilyRelationFilterEdit.Free;
    frmENFamilyRelationFilterEdit:=nil;
  end;}
end;

procedure TfrmENFamilyRelationShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.