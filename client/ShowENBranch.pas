unit ShowENBranch;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,Grids,
  ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2, ENBranchController, AdvObj;


type
  TfrmENBranchShow = class(TChildForm)
    HTTPRIOENBranch: THTTPRIO;
    ImageList1: TImageList;
    sgENBranch: TAdvStringGrid;
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
    HTTPRIOENPanel: THTTPRIO;
    HTTPRIOENTransformer: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENBranchTopLeftChanged(Sender: TObject);
    procedure sgENBranchDblClick(Sender: TObject);
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
  branchCode: Integer;
  frmENBranchShow: TfrmENBranchShow;

implementation

uses Main, EditENBranch, EditENBranchFilter, ENPanelController,
  ENTransformerController;

{$R *.dfm}

var ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBranchHeaders: array [1..7] of String =
        ( 'Код'
          ,'Название присоединения'
          ,'Основные потребители'
          ,'Номер'
          ,'Панель'
          ,'Трансформатор'
          ,'Допустимый ток, А'
        );
   

procedure TfrmENBranchShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENBranchShow := nil;
  inherited;
end;


procedure TfrmENBranchShow.FormShow(Sender: TObject);
var i: Integer; TempENBranch: ENBranchControllerSoapPort;
  ENBranchList: ENBranchShortList;
  TempENPanel: ENPanelControllerSoapPort; ENPanelObj: ENPanel;
  TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerObj: ENTransformer;
begin
  SetGridHeaders(ENBranchHeaders, sgENBranch.ColumnHeaders);
  ColCount := 100;
  TempENBranch :=  HTTPRIOENBranch as ENBranchControllerSoapPort;
  if FilterObject = nil then
    begin
      FilterObject := ENBranchFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;
  ENBranchList := TempENBranch.getScrollableFilteredList(
    ENBranchFilter(FilterObject), 0, ColCount);
  LastCount := High(ENBranchList.list);
  if LastCount > -1 then
    sgENBranch.RowCount := LastCount+2
  else
    sgENBranch.RowCount := 2;

   with sgENBranch do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBranchList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENBranchList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENBranchList.list[i].name;
        Cells[2, i + 1] := ENBranchList.list[i].basicConsumer;
        Cells[3, i + 1] := ENBranchList.list[i].numberGen;
        Cells[4, i + 1] := ENBranchList.list[i].panelName;
        if ENBranchList.list[i].panelCode > 0 then
          begin
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            ENPanelObj := TempENPanel.getObject(ENBranchList.list[i].panelCode);
            try
              if ENPanelObj.transformer <> nil then
                if ENPanelObj.transformer.code <> low(Integer) then
                  begin
                    TempENTransformer :=
                      HTTPRIOENTransformer as ENTransformerControllerSoapPort;
                    ENTransformerObj :=
                      TempENTransformer.getObject(ENPanelObj.transformer.code);
                    try
                      Cells[5, i + 1] := ENTransformerObj.name;
                    finally
                      ENTransformerObj.Free;
                      ENTransformerObj := nil;
                    end;
                  end;
            finally
              ENPanelObj.Free;
              ENPanelObj := nil;
            end;
          end;
        if ENBranchList.list[i].currentAdmis = nil then
          Cells[6, i + 1] := ''
        else
          Cells[6, i + 1] := ENBranchList.list[i].currentAdmis.DecimalString;
        LastRow := i + 1;
        sgENBranch.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENBranch.Row := 1;
end;

procedure TfrmENBranchShow.sgENBranchTopLeftChanged(Sender: TObject);
var
  TempENBranch: ENBranchControllerSoapPort;
  i,CurrentRow: Integer;
  ENBranchList: ENBranchShortList;
  TempENPanel: ENPanelControllerSoapPort; ENPanelObj: ENPanel;
  TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerObj: ENTransformer;
begin
  if LastCount < 99 then Exit;
  if (sgENBranch.TopRow + sgENBranch.VisibleRowCount) = ColCount
  then
    begin
      TempENBranch :=  HTTPRIOENBranch as ENBranchControllerSoapPort;
      CurrentRow:=sgENBranch.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBranchFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBranchList := TempENBranch.getScrollableFilteredList(ENBranchFilter(FilterObject),ColCount-1, 100);



  sgENBranch.RowCount:=sgENBranch.RowCount+100;
  LastCount:=High(ENBranchList.list);
  with sgENBranch do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBranchList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBranchList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBranchList.list[i].name;
        Cells[2,i+CurrentRow] := ENBranchList.list[i].basicConsumer;
        Cells[3,i+CurrentRow] := ENBranchList.list[i].numberGen;
        Cells[4, i + 1] := ENBranchList.list[i].panelName;
        if ENBranchList.list[i].panelCode > 0 then
          begin
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            ENPanelObj := TempENPanel.getObject(ENBranchList.list[i].panelCode);
            try
              if ENPanelObj.transformer <> nil then
                if ENPanelObj.transformer.code <> low(Integer) then
                  begin
                    TempENTransformer :=
                      HTTPRIOENTransformer as ENTransformerControllerSoapPort;
                    ENTransformerObj :=
                      TempENTransformer.getObject(ENPanelObj.transformer.code);
                    try
                      Cells[5, i + 1] := ENTransformerObj.name;
                    finally
                      ENTransformerObj.Free;
                      ENTransformerObj := nil;
                    end;
                  end;
            finally
              ENPanelObj.Free;
              ENPanelObj := nil;
            end;
          end;
        if ENBranchList.list[i].currentAdmis = nil then
          Cells[6, i + 1] := ''
        else
          Cells[6, i + 1] := ENBranchList.list[i].currentAdmis.DecimalString;
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBranch.Row:=CurrentRow-5;
   sgENBranch.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBranchShow.sgENBranchDblClick(Sender: TObject);
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
    begin
      try
        branchCode := StrToInt(GetReturnValue(sgENBranch,0));
      except
        on EConvertError do Exit;
      end;
      ModalResult:=mrOk;
    end
  else
    actViewExecute(Sender);
end;

procedure TfrmENBranchShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBranch.RowCount-1 do
   for j:=0 to sgENBranch.ColCount-1 do
     sgENBranch.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBranchShow.actViewExecute(Sender: TObject);
Var TempENBranch: ENBranchControllerSoapPort;
begin
 TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
   try
     ENBranchObj := TempENBranch.getObject(StrToInt(sgENBranch.Cells[0,sgENBranch.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBranchEdit:=TfrmENBranchEdit.Create(Application, dsView);
  try
    frmENBranchEdit.ShowModal;
  finally
    frmENBranchEdit.Free;
    frmENBranchEdit:=nil;
  end;
end;

procedure TfrmENBranchShow.actEditExecute(Sender: TObject);
Var TempENBranch: ENBranchControllerSoapPort;
begin
 TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
   try
     ENBranchObj := TempENBranch.getObject(StrToInt(sgENBranch.Cells[0,sgENBranch.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBranchEdit:=TfrmENBranchEdit.Create(Application, dsEdit);
  try
    if frmENBranchEdit.ShowModal= mrOk then
      begin
        //TempENBranch.save(ENBranchObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBranchEdit.Free;
    frmENBranchEdit:=nil;
  end;
end;

procedure TfrmENBranchShow.actDeleteExecute(Sender: TObject);
Var TempENBranch: ENBranchControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBranch.Cells[0,sgENBranch.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Присоединение) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBranch.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBranchShow.actInsertExecute(Sender: TObject);
Var TempENBranch: ENBranchControllerSoapPort;
begin
  TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
  ENBranchObj:=ENBranch.Create;

  try
    frmENBranchEdit:=TfrmENBranchEdit.Create(Application, dsInsert);
    try
      if frmENBranchEdit.ShowModal = mrOk then
      begin
        if ENBranchObj<>nil then
            //TempENBranch.add(ENBranchObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBranchEdit.Free;
      frmENBranchEdit:=nil;
    end;
  finally
    ENBranchObj.Free;
  end;
end;

procedure TfrmENBranchShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBranchShow.actFilterExecute(Sender: TObject);
begin
{frmENBranchFilterEdit:=TfrmENBranchFilterEdit.Create(Application, dsInsert);
  try
    ENBranchFilterObj := ENBranchFilter.Create;
    SetNullIntProps(ENBranchFilterObj);
    SetNullXSProps(ENBranchFilterObj);

    if frmENBranchFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBranchFilter.Create;
      FilterObject := ENBranchFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBranchFilterEdit.Free;
    frmENBranchFilterEdit:=nil;
  end;}
end;

procedure TfrmENBranchShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.
