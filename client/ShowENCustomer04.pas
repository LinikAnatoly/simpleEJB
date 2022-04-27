unit ShowENCustomer04;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList, Grids,
  ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit, ENCustomer04Controller,
  EnergyProController, EnergyProController2, AdvObj;

type
  TfrmENCustomer04Show = class(TChildForm)
    HTTPRIOENCustomer04: THTTPRIO;
    ImageList1: TImageList;
    sgENCustomer04: TAdvStringGrid;
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
    procedure sgENCustomer04TopLeftChanged(Sender: TObject);
    procedure sgENCustomer04DblClick(Sender: TObject);
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
  frmENCustomer04Show: tfrmENCustomer04Show;
  customer04Code: Integer;

implementation

uses Main, EditENCustomer04, EditENCustomer04Filter;


{$R *.dfm}

var ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCustomer04Headers: array [1..4] of String =
        (  'Код'
          ,'Наименование потребителя'
          ,'Адрес'
          ,'Телефон'
        );


procedure TfrmENCustomer04Show.FormClose(
  Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENCustomer04Show:=nil;
  inherited;
end;


procedure TfrmENCustomer04Show.FormShow(Sender: TObject);
var TempENCustomer04: ENCustomer04ControllerSoapPort;
  ENCustomer04List: ENCustomer04ShortList; i: Integer;
begin
  SetGridHeaders(ENCustomer04Headers, sgENCustomer04.ColumnHeaders);
  ColCount := 100;
  TempENCustomer04 :=  HTTPRIOENCustomer04 as ENCustomer04ControllerSoapPort;

  if FilterObject = nil then
    begin
       FilterObject := ENCustomer04Filter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;

  ENCustomer04List := TempENCustomer04.getScrollableFilteredList(
    ENCustomer04Filter(FilterObject), 0, ColCount);
  LastCount := High(ENCustomer04List.list);
  if LastCount > -1 then
    sgENCustomer04.RowCount:=LastCount + 2
  else
    sgENCustomer04.RowCount := 2;

  with sgENCustomer04 do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCustomer04List.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENCustomer04List.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENCustomer04List.list[i].name;


        Cells[2, i + 1] := ''; //Адрес
        if ENCustomer04List.list[i].address <> '' then
          Cells[2, i + 1] := ENCustomer04List.list[i].address
        else if ENCustomer04List.list[i].addressRefCode <> low(Integer)
        then
          begin
            if (ENCustomer04List.list[i].regionName <> '') then
              begin
                if (ENCustomer04List.list[i].regionCode <> 0)
                and (ENCustomer04List.list[i].regionCode <> 1) then
                  Cells[2, i + 1] :=
                    ENCustomer04List.list[i].regionName + 'р-н, '
                else if (ENCustomer04List.list[i].regionCode = 1)
                and (ENCustomer04List.list[i].cityCode <> 1) then
                  Cells[2, i + 1] :=
                    ENCustomer04List.list[i].regionName + ', ';
              end;
            if ENCustomer04List.list[i].cityName <> '' then
              begin
                if ENCustomer04List.list[i].cityTypeName
                  <> '_невідомо_'
                then
                  Cells[2, i + 1] := Cells[2, i + 1]
                    + ENCustomer04List.list[i].cityTypeName + ' ';
                  Cells[2, i + 1] := Cells[2, i + 1]
                    + ENCustomer04List.list[i].cityName;
              end;
            if ENCustomer04List.list[i].streetName <> '' then
              begin
                Cells[2, i + 1] := Cells[2, i + 1] + ', ';
                if ENCustomer04List.list[i].streetTypeName
                  <> '_невідомо_'
                then
                  Cells[2, i + 1] := Cells[2, i + 1]
                    + ENCustomer04List.list[i].streetTypeName + ' ';
                  Cells[2, i + 1] := Cells[2, i + 1]
                    + ENCustomer04List.list[i].streetName;
              end;
            if ENCustomer04List.list[i].locationHouse <> '' then
              Cells[2, i + 1] := Cells[2, i + 1] + ', '
                + ENCustomer04List.list[i].locationHouse;
            if ENCustomer04List.list[i].locationApp <> '' then
              Cells[2, i + 1] := Cells[2, i + 1] + ', кв. '
                + ENCustomer04List.list[i].locationApp;
          end;
        Cells[3, i + 1] := ENCustomer04List.list[i].phone;
        LastRow := i + 1;
        sgENCustomer04.RowCount := LastRow + 1;
      end;
   ColCount := ColCount + 1;
   sgENCustomer04.Row := 1;
end;

procedure TfrmENCustomer04Show.sgENCustomer04TopLeftChanged(Sender: TObject);
var TempENCustomer04: ENCustomer04ControllerSoapPort; i, CurrentRow: Integer;
  ENCustomer04List: ENCustomer04ShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENCustomer04.TopRow + sgENCustomer04.VisibleRowCount) = ColCount
    then
      begin
        TempENCustomer04 :=
          HTTPRIOENCustomer04 as ENCustomer04ControllerSoapPort;
        CurrentRow := sgENCustomer04.RowCount;

        if FilterObject = nil then
          begin
           FilterObject := ENCustomer04Filter.Create;
           SetNullIntProps(FilterObject);
           SetNullXSProps(FilterObject);
          end;

        ENCustomer04List := TempENCustomer04.getScrollableFilteredList(
          ENCustomer04Filter(FilterObject), ColCount - 1, 100);

        sgENCustomer04.RowCount := sgENCustomer04.RowCount + 100;
        LastCount := High(ENCustomer04List.list);
        with sgENCustomer04 do
          for i := 0 to LastCount do
            begin
              Application.ProcessMessages;
              if ENCustomer04List.list[i].code <> Low(Integer) then
                Cells[0, i + CurrentRow] :=
                  IntToStr(ENCustomer04List.list[i].code)
              else
                Cells[0, i + CurrentRow] := '';
              Cells[1, i + CurrentRow] := ENCustomer04List.list[i].name;
                LastRow := i + CurrentRow;
              Cells[2, i + 1] := ''; //Адрес
              if ENCustomer04List.list[i].address <> '' then
                Cells[2, i + 1] := ENCustomer04List.list[i].address
              else if ENCustomer04List.list[i].addressRefCode <> low(Integer)
              then
                begin
                  if (ENCustomer04List.list[i].regionName <> '') then
                    begin
                      if (ENCustomer04List.list[i].regionCode <> 0)
                      and (ENCustomer04List.list[i].regionCode <> 1) then
                        Cells[2, i + 1] :=
                          ENCustomer04List.list[i].regionName + 'р-н, '
                      else if (ENCustomer04List.list[i].regionCode = 1)
                      and (ENCustomer04List.list[i].cityCode <> 1) then
                        Cells[2, i + 1] :=
                          ENCustomer04List.list[i].regionName + ', ';
                    end;
                  if ENCustomer04List.list[i].cityName <> '' then
                    begin
                      if ENCustomer04List.list[i].cityTypeName
                        <> '_невідомо_'
                      then
                        Cells[2, i + 1] := Cells[2, i + 1]
                          + ENCustomer04List.list[i].cityTypeName + ' ';
                        Cells[2, i + 1] := Cells[2, i + 1]
                          + ENCustomer04List.list[i].cityName;
                    end;
                  if ENCustomer04List.list[i].streetName <> '' then
                    begin
                      Cells[2, i + 1] := Cells[2, i + 1] + ', ';
                      if ENCustomer04List.list[i].streetTypeName
                        <> '_невідомо_'
                      then
                        Cells[2, i + 1] := Cells[2, i + 1]
                          + ENCustomer04List.list[i].streetTypeName + ' ';
                        Cells[2, i + 1] := Cells[2, i + 1]
                          + ENCustomer04List.list[i].streetName;
                    end;
                  if ENCustomer04List.list[i].locationHouse <> '' then
                    Cells[2, i + 1] := Cells[2, i + 1] + ', '
                      + ENCustomer04List.list[i].locationHouse;
                  if ENCustomer04List.list[i].locationApp <> '' then
                    Cells[2, i + 1] := Cells[2, i + 1] + ', кв. '
                      + ENCustomer04List.list[i].locationApp;
                end;
              Cells[3, i + 1] := ENCustomer04List.list[i].phone;
            end;
         ColCount := ColCount + 100;
         sgENCustomer04.Row := CurrentRow - 5;
         sgENCustomer04.RowCount := LastRow + 1;
    end;
end;

procedure TfrmENCustomer04Show.sgENCustomer04DblClick(Sender: TObject);
begin
  if FormMode = fmNormal then
    begin
      try
        customer04Code := StrToInt(GetReturnValue(sgENCustomer04, 0));
      except
        on EConvertError do Exit;
      end;
      ModalResult := mrOk;
    end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCustomer04Show.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i := 1 to sgENCustomer04.RowCount - 1 do
   for j := 0 to sgENCustomer04.ColCount - 1 do
     sgENCustomer04.Cells[j, i] := '';
   FormShow(Sender);
end;

procedure TfrmENCustomer04Show.actViewExecute(Sender: TObject);
Var TempENCustomer04: ENCustomer04ControllerSoapPort;
begin
  TempENCustomer04 := HTTPRIOENCustomer04 as ENCustomer04ControllerSoapPort;
  try
    ENCustomer04Obj := TempENCustomer04.getObject(
      StrToInt(sgENCustomer04.Cells[0, sgENCustomer04.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENCustomer04Edit := TfrmENCustomer04Edit.Create(Application, dsView);
  try
    frmENCustomer04Edit.ShowModal;
  finally
    frmENCustomer04Edit.Free;
    frmENCustomer04Edit := nil;
  end;
end;

procedure TfrmENCustomer04Show.actEditExecute(Sender: TObject);
Var TempENCustomer04: ENCustomer04ControllerSoapPort;
begin
  TempENCustomer04 := HTTPRIOENCustomer04 as ENCustomer04ControllerSoapPort;
  try
    ENCustomer04Obj := TempENCustomer04.getObject(
      StrToInt(sgENCustomer04.Cells[0, sgENCustomer04.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENCustomer04Edit := TfrmENCustomer04Edit.Create(Application, dsEdit);
  try
    if frmENCustomer04Edit.ShowModal= mrOk then
      UpdateGrid(Sender);
  finally
    frmENCustomer04Edit.Free;
    frmENCustomer04Edit := nil;
  end;
end;

procedure TfrmENCustomer04Show.actDeleteExecute(Sender: TObject);
Var TempENCustomer04: ENCustomer04ControllerSoapPort;
  ObjCode: Integer;
begin
  TempENCustomer04 := HTTPRIOENCustomer04 as ENCustomer04ControllerSoapPort;
  try
    ObjCode := StrToInt(sgENCustomer04.Cells[0, sgENCustomer04.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(
    PChar('Вы действительно хотите удалить Потребителя мощности 0,4 кВ?'),
    PChar('Внимание!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK
  then
    begin
      TempENCustomer04.remove(ObjCode);
      UpdateGrid(Sender);
    end;
end;

procedure TfrmENCustomer04Show.actInsertExecute(Sender: TObject);
begin
  ENCustomer04Obj := ENCustomer04.Create;
  try
    frmENCustomer04Edit := TfrmENCustomer04Edit.Create(Application, dsInsert);
    try
      if frmENCustomer04Edit.ShowModal = mrOk then
        if ENCustomer04Obj <> nil then
            UpdateGrid(Sender);
    finally
      frmENCustomer04Edit.Free;
      frmENCustomer04Edit := nil;
    end;
  finally
    ENCustomer04Obj.Free;
  end;
end;

procedure TfrmENCustomer04Show.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmENCustomer04Show.actFilterExecute(Sender: TObject);
begin
  frmENCustomer04FilterEdit :=
    TfrmENCustomer04FilterEdit.Create(Application, dsInsert);
  try
    ENCustomer04FilterObj := ENCustomer04Filter.Create;
    SetNullIntProps(ENCustomer04FilterObj);
    SetNullXSProps(ENCustomer04FilterObj);
    if frmENCustomer04FilterEdit.ShowModal = mrOk then
      begin
        FilterObject := ENCustomer04FilterObj;
        actUpdateExecute(Sender);
      end;
  finally
    frmENCustomer04FilterEdit.Free;
    frmENCustomer04FilterEdit := nil;
  end;
end;

procedure TfrmENCustomer04Show.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.