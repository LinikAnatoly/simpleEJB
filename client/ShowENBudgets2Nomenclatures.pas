
unit ShowENBudgets2Nomenclatures;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENBudgets2NomenclaturesController, AdvObj ;


type
    TfrmENBudgets2NomenclaturesShow = class(TChildForm)  
    HTTPRIOENBudgets2Nomenclatures: THTTPRIO;
    ImageList1: TImageList;
    sgENBudgets2Nomenclatures: TAdvStringGrid;
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
    procedure sgENBudgets2NomenclaturesTopLeftChanged(Sender: TObject);
    procedure sgENBudgets2NomenclaturesDblClick(Sender: TObject);
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

//var
 // ENBudgets2NomenclaturesObj: ENBudgets2Nomenclatures;
 // ENBudgets2NomenclaturesFilterObj: ENBudgets2NomenclaturesFilter;
  
  
implementation

uses Main, EditENBudgets2Nomenclatures, EditENBudgets2NomenclaturesFilter;


{$R *.dfm}

var
  //frmENBudgets2NomenclaturesShow : TfrmENBudgets2NomenclaturesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBudgets2NomenclaturesHeaders: array [1..4] of String =
        ( 'Код'
          ,'Номенклатурний №'
          ,'Назва матеріалу'
          , 'Бюджетотримач'
        );
   

procedure TfrmENBudgets2NomenclaturesShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENBudgets2NomenclaturesShow:=nil;
  inherited;
end;


procedure TfrmENBudgets2NomenclaturesShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENBudgets2NomenclaturesShow.FormShow(Sender: TObject);
var
  TempENBudgets2Nomenclatures: ENBudgets2NomenclaturesControllerSoapPort;
  i: Integer;
  ENBudgets2NomenclaturesList: ENBudgets2NomenclaturesShortList;
begin
  SetGridHeaders(ENBudgets2NomenclaturesHeaders, sgENBudgets2Nomenclatures.ColumnHeaders);
  ColCount:=100;
  TempENBudgets2Nomenclatures :=  HTTPRIOENBudgets2Nomenclatures as ENBudgets2NomenclaturesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBudgets2NomenclaturesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBudgets2NomenclaturesList := TempENBudgets2Nomenclatures.getScrollableFilteredList(ENBudgets2NomenclaturesFilter(FilterObject),0,ColCount);
  LastCount:=High(ENBudgets2NomenclaturesList.list);

  if LastCount > -1 then
     sgENBudgets2Nomenclatures.RowCount:=LastCount+2
  else
     sgENBudgets2Nomenclatures.RowCount:=2;

   with sgENBudgets2Nomenclatures do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBudgets2NomenclaturesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBudgets2NomenclaturesList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBudgets2NomenclaturesList.list[i].nn;
        Cells[2,i+1] := ENBudgets2NomenclaturesList.list[i].mat_name;
        Cells[3,i+1] := ENBudgets2NomenclaturesList.list[i].budgetRefShortName;

        LastRow:=i+1;
        sgENBudgets2Nomenclatures.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENBudgets2Nomenclatures.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENBudgets2Nomenclatures.RowCount > selectedRow then
      sgENBudgets2Nomenclatures.Row := selectedRow
    else
      sgENBudgets2Nomenclatures.Row := sgENBudgets2Nomenclatures.RowCount - 1;
    end
    else
      sgENBudgets2Nomenclatures.Row:=1;   
end;


procedure TfrmENBudgets2NomenclaturesShow.sgENBudgets2NomenclaturesTopLeftChanged(Sender: TObject);
var
  TempENBudgets2Nomenclatures: ENBudgets2NomenclaturesControllerSoapPort;
  i,CurrentRow: Integer;
  ENBudgets2NomenclaturesList: ENBudgets2NomenclaturesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBudgets2Nomenclatures.TopRow + sgENBudgets2Nomenclatures.VisibleRowCount) = ColCount
  then
    begin
      TempENBudgets2Nomenclatures :=  HTTPRIOENBudgets2Nomenclatures as ENBudgets2NomenclaturesControllerSoapPort;
      CurrentRow:=sgENBudgets2Nomenclatures.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBudgets2NomenclaturesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBudgets2NomenclaturesList := TempENBudgets2Nomenclatures.getScrollableFilteredList(ENBudgets2NomenclaturesFilter(FilterObject),ColCount-1, 100);


  sgENBudgets2Nomenclatures.RowCount:=sgENBudgets2Nomenclatures.RowCount+100;
  LastCount:=High(ENBudgets2NomenclaturesList.list);
  with sgENBudgets2Nomenclatures do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBudgets2NomenclaturesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBudgets2NomenclaturesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBudgets2NomenclaturesList.list[i].nn;
        Cells[2,i+CurrentRow] := ENBudgets2NomenclaturesList.list[i].mat_name;
        Cells[3,i+CurrentRow] := ENBudgets2NomenclaturesList.list[i].budgetRefShortName;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBudgets2Nomenclatures.Row:=CurrentRow-5;
   sgENBudgets2Nomenclatures.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBudgets2NomenclaturesShow.sgENBudgets2NomenclaturesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBudgets2Nomenclatures,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENBudgets2NomenclaturesShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENBudgets2Nomenclatures.RowCount-1 do
   for j:=0 to sgENBudgets2Nomenclatures.ColCount-1 do
     sgENBudgets2Nomenclatures.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENBudgets2NomenclaturesShow.actViewExecute(Sender: TObject);
var 
  TempENBudgets2Nomenclatures: ENBudgets2NomenclaturesControllerSoapPort;
begin
  TempENBudgets2Nomenclatures := HTTPRIOENBudgets2Nomenclatures as ENBudgets2NomenclaturesControllerSoapPort;
  try
    ENBudgets2NomenclaturesObj := TempENBudgets2Nomenclatures.getObject(StrToInt(sgENBudgets2Nomenclatures.Cells[0,sgENBudgets2Nomenclatures.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBudgets2Nomenclatures.Row;
  frmENBudgets2NomenclaturesEdit:=TfrmENBudgets2NomenclaturesEdit.Create(Application, dsView);
  
  try
    frmENBudgets2NomenclaturesEdit.ShowModal;
  finally
    frmENBudgets2NomenclaturesEdit.Free;
    frmENBudgets2NomenclaturesEdit:=nil;
  end;

  if sgENBudgets2Nomenclatures.RowCount > selectedRow then
    sgENBudgets2Nomenclatures.Row := selectedRow
  else
    sgENBudgets2Nomenclatures.Row := sgENBudgets2Nomenclatures.RowCount - 1;
  
end;


procedure TfrmENBudgets2NomenclaturesShow.actEditExecute(Sender: TObject);
var 
  TempENBudgets2Nomenclatures: ENBudgets2NomenclaturesControllerSoapPort;
begin
  TempENBudgets2Nomenclatures := HTTPRIOENBudgets2Nomenclatures as ENBudgets2NomenclaturesControllerSoapPort;
  try
    ENBudgets2NomenclaturesObj := TempENBudgets2Nomenclatures.getObject(StrToInt(sgENBudgets2Nomenclatures.Cells[0,sgENBudgets2Nomenclatures.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENBudgets2Nomenclatures.Row;
  frmENBudgets2NomenclaturesEdit:=TfrmENBudgets2NomenclaturesEdit.Create(Application, dsEdit);
  
  try
    if frmENBudgets2NomenclaturesEdit.ShowModal= mrOk then
      begin
        //TempENBudgets2Nomenclatures.save(ENBudgets2NomenclaturesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBudgets2NomenclaturesEdit.Free;
    frmENBudgets2NomenclaturesEdit:=nil;
  end;

  if sgENBudgets2Nomenclatures.RowCount > selectedRow then
    sgENBudgets2Nomenclatures.Row := selectedRow
  else
    sgENBudgets2Nomenclatures.Row := sgENBudgets2Nomenclatures.RowCount - 1;
  
end;


procedure TfrmENBudgets2NomenclaturesShow.actDeleteExecute(Sender: TObject);
Var TempENBudgets2Nomenclatures: ENBudgets2NomenclaturesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBudgets2Nomenclatures := HTTPRIOENBudgets2Nomenclatures as ENBudgets2NomenclaturesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBudgets2Nomenclatures.Cells[0,sgENBudgets2Nomenclatures.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Связь бюджетодержателя с номенклатурой ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBudgets2Nomenclatures.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBudgets2NomenclaturesShow.actInsertExecute(Sender: TObject);
// Var TempENBudgets2Nomenclatures: ENBudgets2NomenclaturesControllerSoapPort; 
begin
  // TempENBudgets2Nomenclatures := HTTPRIOENBudgets2Nomenclatures as ENBudgets2NomenclaturesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENBudgets2NomenclaturesObj:=ENBudgets2Nomenclatures.Create;
  SetNullIntProps(ENBudgets2NomenclaturesObj);
  SetNullXSProps(ENBudgets2NomenclaturesObj);



  try
    frmENBudgets2NomenclaturesEdit:=TfrmENBudgets2NomenclaturesEdit.Create(Application, dsInsert);
    try
      if frmENBudgets2NomenclaturesEdit.ShowModal = mrOk then
      begin
        if ENBudgets2NomenclaturesObj<>nil then
            //TempENBudgets2Nomenclatures.add(ENBudgets2NomenclaturesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBudgets2NomenclaturesEdit.Free;
      frmENBudgets2NomenclaturesEdit:=nil;
    end;
  finally
    ENBudgets2NomenclaturesObj.Free;
  end;
end;


procedure TfrmENBudgets2NomenclaturesShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENBudgets2NomenclaturesShow.actFilterExecute(Sender: TObject);
begin
frmENBudgets2NomenclaturesFilterEdit:=TfrmENBudgets2NomenclaturesFilterEdit.Create(Application, dsInsert);
  try
    ENBudgets2NomenclaturesFilterObj := ENBudgets2NomenclaturesFilter.Create;
    SetNullIntProps(ENBudgets2NomenclaturesFilterObj);
    SetNullXSProps(ENBudgets2NomenclaturesFilterObj);

    if frmENBudgets2NomenclaturesFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENBudgets2NomenclaturesFilter.Create;
      FilterObject := ENBudgets2NomenclaturesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBudgets2NomenclaturesFilterEdit.Free;
    frmENBudgets2NomenclaturesFilterEdit:=nil;
  end;
end;


procedure TfrmENBudgets2NomenclaturesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.