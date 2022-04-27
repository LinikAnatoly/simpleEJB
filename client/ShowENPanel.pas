unit ShowENPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,Grids,
  ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2, ENPanelController, AdvObj;


type
  TfrmENPanelShow = class(TChildForm)
    HTTPRIOENPanel: THTTPRIO;
    ImageList1: TImageList;
    sgENPanel: TAdvStringGrid;
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
    procedure sgENPanelTopLeftChanged(Sender: TObject);
    procedure sgENPanelDblClick(Sender: TObject);
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
  frmENPanelShow: TfrmENPanelShow;
  panelCode: Integer;

implementation

uses Main, EditENPanel, EditENPanelFilter;


{$R *.dfm}

var ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPanelHeaders: array [1..9] of String =
        ( 'Код'
          ,'Назначение'
          ,'Марка сборных шин'
          ,'Разрядник на панели'
          ,'№ панели'
          ,'Трансформатор'
          ,'Код трансформатора'
          ,'Низковльтный щит'
          ,'Код НВЩ'
        );

procedure TfrmENPanelShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPanelShow:=nil;
    inherited;
  end;


procedure TfrmENPanelShow.FormShow(Sender: TObject);
var i: Integer;
  TempENPanel: ENPanelControllerSoapPort;
  ENPanelList: ENPanelShortList;
begin
  SetGridHeaders(ENPanelHeaders, sgENPanel.ColumnHeaders);
  ColCount := 100;
  TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENPanelFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENPanelList := TempENPanel.getScrollableFilteredList(
    ENPanelFilter(FilterObject), 0, ColCount);

  LastCount:=High(ENPanelList.list);

  if LastCount > -1 then
    sgENPanel.RowCount:=LastCount+2
  else
    sgENPanel.RowCount:=2;

  with sgENPanel do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPanelList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENPanelList.list[i].code) //Код панели
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENPanelList.list[i].panelTypeName; //Назначение панели
        Cells[2, i + 1] := ENPanelList.list[i].matBusRefName; //Марка сборных шин панели
        Cells[3, i + 1] := ENPanelList.list[i].matArresterRefName; //Разрядник на панели
        Cells[4, i + 1] := ENPanelList.list[i].name; //Номер панели

        Cells[5, i + 1] := ENPanelList.list[i].transformerName; //Трансформатор
        if ENPanelList.list[i].transformerNominalPower <> nil then
          if ENPanelList.list[i].transformerNominalPower.DecimalString <> ''
          then
            Cells[5, i + 1] := Cells[5, i + 1] + ', P = '
              + ENPanelList.list[i].transformerNominalPower.DecimalString
              + 'кВА';
        if ENPanelList.list[i].transformerInvNumber <> '' then
          Cells[5, i + 1] := Cells[5, i + 1]
            + ENPanelList.list[i].transformerInvNumber;
        Cells[6, i + 1] := IntToStr(ENPanelList.list[i].transformerCode); //Код трансформатора
        Cells[7, i + 1] := ENPanelList.list[i].lowVoltBoardName; //НВЩ
        if ENPanelList.list[i].lowVoltBoardCode <> low(Integer) then
          Cells[8, i + 1] := IntToStr(ENPanelList.list[i].lowVoltBoardCode) //Код НВЩ
        else
          Cells[8, i + 1] := '';

        LastRow := i + 1;
        sgENPanel.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENPanel.Row := 1;
end;

procedure TfrmENPanelShow.sgENPanelTopLeftChanged(Sender: TObject);
var i, CurrentRow: Integer;
  TempENPanel: ENPanelControllerSoapPort;
  ENPanelList: ENPanelShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENPanel.TopRow + sgENPanel.VisibleRowCount) = ColCount
  then
    begin
      TempENPanel :=  HTTPRIOENPanel as ENPanelControllerSoapPort;
      CurrentRow:=sgENPanel.RowCount;

      if FilterObject = nil then
      begin
         FilterObject := ENPanelFilter.Create;
         SetNullIntProps(FilterObject);
         SetNullXSProps(FilterObject);
      end;

      ENPanelList := TempENPanel.getScrollableFilteredList(
        ENPanelFilter(FilterObject), ColCount - 1, 100);

      sgENPanel.RowCount := sgENPanel.RowCount + 100;
      LastCount := High(ENPanelList.list);
      with sgENPanel do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENPanelList.list[i].code <> Low(Integer) then
              Cells[0, i + CurrentRow] := IntToStr(ENPanelList.list[i].code) //Код панели
            else
              Cells[0, i + CurrentRow] := '';
            Cells[1, i + CurrentRow] := ENPanelList.list[i].panelTypeName; //Назначение панели
            Cells[2, i + CurrentRow] := ENPanelList.list[i].matBusRefName; //Марка сборных шин панели
            Cells[3, i + CurrentRow] := ENPanelList.list[i].matArresterRefName; //Разрядник на панели
            Cells[4, i + CurrentRow] := ENPanelList.list[i].name; //Номер панели

            Cells[5, i + CurrentRow] := ENPanelList.list[i].transformerName; //Трансформатор
            if ENPanelList.list[i].transformerNominalPower <> nil then
              if ENPanelList.list[i].transformerNominalPower.DecimalString <> ''
              then
                Cells[5, i + CurrentRow] := Cells[5, i + CurrentRow] + ', P = '
                  + ENPanelList.list[i].transformerNominalPower.DecimalString
                  + 'кВА';
            if ENPanelList.list[i].transformerInvNumber <> '' then
              Cells[5, i + CurrentRow] := Cells[5, i + CurrentRow]
                + ENPanelList.list[i].transformerInvNumber;
            Cells[6, i + CurrentRow] := IntToStr(ENPanelList.list[i].transformerCode); //Код трансформатора
              LastRow := i + CurrentRow;
            Cells[7, i + CurrentRow] := ENPanelList.list[i].lowVoltBoardName; //НВЩ
            if ENPanelList.list[i].lowVoltBoardCode <> low(Integer) then
              Cells[8, i + CurrentRow] := IntToStr(ENPanelList.list[i].lowVoltBoardCode) //Код НВЩ
            else
              Cells[8, i + CurrentRow] := '';
          end;
       ColCount := ColCount + 100;
       sgENPanel.Row := CurrentRow - 5;
       sgENPanel.RowCount := LastRow + 1;
    end; //if (sgENPanel.TopRow + sgENPanel.VisibleRowCount) = ColCount
end;

procedure TfrmENPanelShow.sgENPanelDblClick(Sender: TObject);
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
    begin
      try
        panelCode := StrToInt(GetReturnValue(sgENPanel, 0));
      except
        on EConvertError do Exit;
      end;
      ModalResult := mrOk;
    end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPanelShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPanel.RowCount-1 do
   for j:=0 to sgENPanel.ColCount-1 do
     sgENPanel.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPanelShow.actViewExecute(Sender: TObject);
Var TempENPanel: ENPanelControllerSoapPort;
begin
 TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
   try
     ENPanelObj := TempENPanel.getObject(StrToInt(sgENPanel.Cells[0,sgENPanel.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPanelEdit:=TfrmENPanelEdit.Create(Application, dsView);
  try
    frmENPanelEdit.ShowModal;
  finally
    frmENPanelEdit.Free;
    frmENPanelEdit:=nil;
  end;
end;

procedure TfrmENPanelShow.actEditExecute(Sender: TObject);
Var TempENPanel: ENPanelControllerSoapPort;
begin
 TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
   try
     ENPanelObj := TempENPanel.getObject(StrToInt(sgENPanel.Cells[0,sgENPanel.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPanelEdit:=TfrmENPanelEdit.Create(Application, dsEdit);
  try
    if frmENPanelEdit.ShowModal= mrOk then
      begin
        //TempENPanel.save(ENPanelObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPanelEdit.Free;
    frmENPanelEdit:=nil;
  end;
end;

procedure TfrmENPanelShow.actDeleteExecute(Sender: TObject);
Var TempENPanel: ENPanelControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPanel.Cells[0,sgENPanel.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Панели низковольтного щита) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPanel.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPanelShow.actInsertExecute(Sender: TObject);
Var TempENPanel: ENPanelControllerSoapPort;
begin
  TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
  ENPanelObj:=ENPanel.Create;



  try
    frmENPanelEdit:=TfrmENPanelEdit.Create(Application, dsInsert);
    try
      if frmENPanelEdit.ShowModal = mrOk then
      begin
        if ENPanelObj<>nil then
            //TempENPanel.add(ENPanelObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPanelEdit.Free;
      frmENPanelEdit:=nil;
    end;
  finally
    ENPanelObj.Free;
  end;
end;

procedure TfrmENPanelShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPanelShow.actFilterExecute(Sender: TObject);
begin
{frmENPanelFilterEdit:=TfrmENPanelFilterEdit.Create(Application, dsInsert);
  try
    ENPanelFilterObj := ENPanelFilter.Create;
    SetNullIntProps(ENPanelFilterObj);
    SetNullXSProps(ENPanelFilterObj);

    if frmENPanelFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPanelFilter.Create;
      FilterObject := ENPanelFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPanelFilterEdit.Free;
    frmENPanelFilterEdit:=nil;
  end;}
end;

procedure TfrmENPanelShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.
