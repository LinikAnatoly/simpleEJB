unit EditGeoCoordinatesImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, xmldom, XMLIntf, msxmldom,
  XMLDoc, InvokeRegistry, Rio, SOAPHTTPClient, ComCtrls;

type
  TfrmGeoCoordinatesImportEdit = class(TDialogForm)
    edtFileName: TEdit;
    spbOpen: TSpeedButton;
    btnImport: TButton;
    odFile: TOpenDialog;
    xmlCoordinates: TXMLDocument;
    HTTPRIOENCoordinates: THTTPRIO;
    HTTPRIOEPRen: THTTPRIO;
    HTTPRIOENSubstation04: THTTPRIO;
    log: TMemo;
    btnNotInGoogleEarth: TButton;
    procedure FormShow(Sender: TObject);
    procedure spbOpenClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure btnNotInGoogleEarthClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeoCoordinatesImportEdit: TfrmGeoCoordinatesImportEdit;

implementation

uses ENCoordinatesController, XSBuiltIns, EnergyproController,
     ENSubstation04Controller, ENElementController, DMReportsUnit;

{$R *.dfm}

procedure TfrmGeoCoordinatesImportEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtFileName]);
end;

procedure TfrmGeoCoordinatesImportEdit.spbOpenClick(Sender: TObject);
begin
  if odFile.Execute then
    edtFileName.Text := odFile.FileName;
end;

procedure TfrmGeoCoordinatesImportEdit.btnImportClick(Sender: TObject);
var
    i, j, h, g, f, d, s, elementCode : Integer;
    objENCoordinates, objENCoordinatesCurrent : ENCoordinates;
    coordinatesFilter : ENCoordinatesFilter;
    coordinatesList : ENCoordinatesShortList;
    TempENCoordinates: ENCoordinatesControllerSoapPort;
    TempEPRen : EPRenControllerSoapPort;
    ren : EPRen;
    renFilter : EPRenFilter;
    renList : EPRenShortList;
    TempENSubstation04 : ENSubstation04ControllerSoapPort;
    substation04Filter : ENSubstation04Filter;
    substation04List : ENSubstation04ShortList;
    Node, renNodes, objNodes, objCoordinatesNodes : IXMLNode;
    text, longitude, latitude : String;
begin
  if edtFileName.Text = '' then Exit;

  xmlCoordinates.Active := false;
  xmlCoordinates.XML.Clear;
  xmlCoordinates.XML.LoadFromFile(edtFileName.Text, TEncoding.UTF8);
  xmlCoordinates.Active := true;

  TempENCoordinates := HTTPRIOENCoordinates as ENCoordinatesControllerSoapPort;

  with xmlCoordinates.DocumentElement do
    for i := 0 to ChildNodes.Count - 1 do
    begin
      //Edit1.Text := UpperCase(ChildNodes[i].NodeName);

      if UpperCase(ChildNodes[i].NodeName) = UpperCase('Document') then
      begin

        for j := 0 to ChildNodes[i].ChildNodes.Count - 1 do
        begin

          // Верхняя папка  ( Мои метки )
          if UpperCase(ChildNodes[i].ChildNodes[j].NodeName) = UpperCase('folder') then
          begin

            for h := 0 to ChildNodes[i].ChildNodes[j].ChildNodes.Count - 1 do
            begin
              //  РЭС
              renNodes := ChildNodes[i].ChildNodes[j].ChildNodes[h];

              // может быть как в folder, так и в document....
              if (UpperCase(renNodes.NodeName) = UpperCase('folder'))
                  or (UpperCase(renNodes.NodeName) = UpperCase('document')) then
              begin

                for g := 0 to renNodes.ChildNodes.Count - 1 do
                begin

                  if UpperCase(renNodes.ChildNodes[g].NodeName) = UpperCase('name') then
                  begin
                    renFilter := EPRenFilter.Create;
                    SetNullIntProps(renFilter);
                    SetNullXSProps(renFilter);
                    renFilter.name := renNodes.ChildNodes[g].Text;

                    log.Lines.Add('обработка элементов подразделения : ' + renNodes.ChildNodes[g].Text + '...');

                    TempEPRen := HTTPRIOEPRen as EPRenControllerSoapPort;
                    renList := TempEPRen.getScrollableFilteredList(renFilter,0,-1);
                    if (renList.totalCount > 0) then
                    begin
                      ren := EPRen.Create;
                      SetNullIntProps(ren);
                      SetNullXSProps(ren);
                      ren := TempEPRen.getObject(renList.list[0].code);
                      //log.Lines.Add('подразделение: ' + renNodes.ChildNodes[g].Text + ' ok...');
                    end else
                    begin
                      log.Lines.Add('подразделение : ' + renNodes.ChildNodes[g].Text + ' не найдено...');
                      Break;
                    end;
                  end else

                  if (ren <> nil) and (ren.code <> low(Integer))
                   and (UpperCase(renNodes.ChildNodes[g].NodeName) = UpperCase('Placemark')) then
                  // объект ТП, КТП и т.д. и т.п.
                  // objNodes := renNodes.ChildNodes[g];   //ChildNodes[i].ChildNodes[j].ChildNodes[h].ChildNodes[g];

                  //if UpperCase(objNodes.NodeName) = UpperCase('Placemark') then
                  begin

                    objNodes := renNodes.ChildNodes[g];   //ChildNodes[i].ChildNodes[j].ChildNodes[h].ChildNodes[g];

                    for f := 0 to objNodes.ChildNodes.Count - 1 do
                    begin

                      if UpperCase(objNodes.ChildNodes[f].NodeName) = UpperCase('name') then
                      begin

                        elementCode := low(Integer);

                        substation04Filter := ENSubstation04Filter.Create;
                        SetNullIntProps(substation04Filter);
                        SetNullXSProps(substation04Filter);

                        if (ren <> nil) and (ren.code <> low(Integer)) then
                        begin

                          substation04Filter.name := objNodes.ChildNodes[f].Text;
                          substation04Filter.element := ENElement.Create;
                          substation04Filter.element.renRef := EPRenRef.Create;
                          substation04Filter.element.renRef.code := ren.code;

                          TempENSubstation04 := HTTPRIOENSubstation04 as ENSubstation04ControllerSoapPort;
                          substation04List := TempENSubstation04.getSubstationUnionList(substation04Filter,0,-1);

                          if (substation04List.totalCount > 0) then
                          begin
                            elementCode := substation04List.list[0].elementCode;
                            //log.Lines.Add('элемент: ' + objNodes.ChildNodes[f].Text + ' : ' + ren.name + ' ok...');
                          end else
                          begin
                            log.Lines.Add('элемент: ' + objNodes.ChildNodes[f].Text + ' : ' + ren.name + ' не найдено...');
                            Break;
                          end;

                        end;

                      end else


                      if (elementCode <> low(Integer))
                          and ((UpperCase(objNodes.ChildNodes[f].NodeName) = UpperCase('LookAt'))
                             or (UpperCase(objNodes.ChildNodes[f].NodeName) = UpperCase('Camera'))) then
                      begin
                        // координаты объекта
                        objCoordinatesNodes := objNodes.ChildNodes[f]; //ChildNodes[i].ChildNodes[j].ChildNodes[h].ChildNodes[f];

                        for d := 0 to objCoordinatesNodes.ChildNodes.Count - 1 do
                        begin

                          if UpperCase(objCoordinatesNodes.ChildNodes[d].NodeName) = UpperCase('longitude') then
                          begin
                            longitude := objCoordinatesNodes.ChildNodes[d].Text;
                          end;

                          if UpperCase(objCoordinatesNodes.ChildNodes[d].NodeName) = UpperCase('latitude') then
                          begin
                            latitude := objCoordinatesNodes.ChildNodes[d].Text;
                          end;

                        end;

                        ////////////////////////////////////////

                        // если нашли РЭС и ТП-ху - пробуем найти координаты
                        if ((ren <> nil) and (ren.code <> low(Integer)))
                              and (elementCode <> low(Integer)) then
                        begin

                          coordinatesFilter := ENCoordinatesFilter.Create;
                          SetNullIntProps(coordinatesFilter);
                          SetNullXSProps(coordinatesFilter);

                          coordinatesFilter.element := ENElement.Create;
                          coordinatesFilter.element.code := elementCode;

                          coordinatesList := TempENCoordinates.getScrollableFilteredList(coordinatesFilter,0,-1);

                          // если уже есть такая запись по объекту - сохраняем
                          if (coordinatesList.totalCount > 0) then
                          begin

                            objENCoordinates := TempENCoordinates.getObject(coordinatesList.list[0].code);

                            objENCoordinates.latitude := TXSDecimal.Create;
                            objENCoordinates.latitude.DecimalString := latitude;
                            objENCoordinates.longitude := TXSDecimal.Create;
                            objENCoordinates.longitude.DecimalString := longitude;

                            TempENCoordinates.save(objENCoordinates);

                          end else
                          // если ничё нет - добавляем
                          begin

                            objENCoordinates := ENCoordinates.Create;
                            SetNullIntProps(objENCoordinates);
                            SetNullXSProps(objENCoordinates);

                            objENCoordinates.element := ENElement.Create;
                            objENCoordinates.element.code := elementCode;

                            objENCoordinates.latitude := TXSDecimal.Create;
                            objENCoordinates.latitude.DecimalString := latitude;
                            objENCoordinates.longitude := TXSDecimal.Create;
                            objENCoordinates.longitude.DecimalString := longitude;

                            TempENCoordinates.add(objENCoordinates);

                          end;

                          Application.ProcessMessages;
                          //log.Lines.Add('элемент: ' + substation04.name + ' : ' + ren.name +
                          // ' : ' + latitude + ' : '+ longitude + ' ok... ');
                        end;

                        ////////////////////////////////////////

                      end;

                    end;

                  end;

                end;

              end;

            end;

          end;

        end;

        Application.ProcessMessages;

      end;

    end;

  xmlCoordinates.Active := false;

  Application.MessageBox(PChar('Завантаження завершено!'), PChar('Інформація'), MB_ICONINFORMATION);
end;

procedure TfrmGeoCoordinatesImportEdit.btnNotInGoogleEarthClick(Sender: TObject);
var argNames, args: ArrayOfString;
begin
  SetLength(argNames, 1);
  SetLength(args, 1);
  argNames[0] := 'IS_IGNORE_PARGINATION';
  args[0] := 'Yes';

  makeReport('Passport/TpInfoAddition4/notInGoogleEarth', argNames, args, 'xls');
end;

end.
